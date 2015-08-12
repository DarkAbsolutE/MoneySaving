require 'spec_helper'
require 'bamboohr/sync'

describe BambooHR::Sync do

  let(:employee_data) do
    {
     'firstName'          => 'Cyan',
     'lastName'           => 'Mendoza',
     'workEmail'          => 'cyan@crowd.com'
    }
  end

  describe ".client" do
    let(:client) { BambooHR::Sync.client }

    it 'returns the client configuration' do
      expect(client).to be_a(BambooHR::Client)
    end

    it 'returns the API TOKEN key' do
      expect(client.key).to eq 'API_TOKEN'
    end

    let 'return the subdomain crowdint' do
      expect(client.subdomain).to eq 'crowdint'
    end
  end

  describe ".employees" do
    let(:client) { double("Client", employee_list: {"employees" => [employee_data]}) }

    before do
      allow(BambooHR::Sync).to receive(:client) { client }
    end

    it 'calls create_employee to every employee on the list' do
      expect(BambooHR::Sync).to receive(:create_employee)
      BambooHR::Sync.employees
    end
  end

  describe ".create_employee" do
    context 'When is importable' do
      let(:new_employee) { Employee.new }

      before do
        allow(BambooHR::Sync).to receive(:importable?) { true }
        allow(Employee).to receive_message_chain(:where, :first_or_create) { new_employee }
      end

      it "returns new employee" do
        expect(BambooHR::Sync.create_employee(employee_data)).to be_a Employee
      end
    end

    context 'When is not importable' do
      before do
        allow(BambooHR::Sync).to receive(:importable?) { false }
      end

      it "returns nil" do
        expect(BambooHR::Sync.create_employee(employee_data)).to be_nil
      end
    end
  end
end
