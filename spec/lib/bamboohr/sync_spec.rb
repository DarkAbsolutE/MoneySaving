require 'spec_helper'
require 'bamboohr/sync'

describe BambooHR::Sync do

  let(:employee_data) do
    {
     'id'                 => '1',
     'displayName'        => 'Cyan Aguirre',
     'firstName'          => 'Cyan',
     'lastName'           => 'Mendoza',
     'jobTitle'           => 'Intern',
     'workPhone'          => nil,
     'workPhoneExtension' => nil,
     'mobilePhone'        => '312-134-7689',
     'workEmail'          => 'cyan@crowd.com',
     'department'         => 'Development',
     'location'           => 'Colima',
     'division'           => nil,
     'photoUploaded'      => false,
     'photoUrl'           => 'https://crowdint.bamboohr.com/images/photo_placeholder.gif',
     'canUploadPhoto'     => 1
    }
  end

  describe :client do
    it 'returns the configured BambooHR::Client object' do
      expect(BambooHR::Sync.client).to be_a(BambooHR::Client)
      expect(BambooHR::Sync.client.key).to eq 'API_TOKEN'
      expect(BambooHR::Sync.client.subdomain).to eq 'crowdint'
    end
  end

  describe :employees, vcr: { cassette_name: 'employee_list' } do
    it 'calls create_employee to every employee on the list' do
      expect(BambooHR::Sync).to receive(:create_employee).with(employee_data)
      BambooHR::Sync.employees
    end
  end

  describe :create_employee do
    it 'creates the employee with the provided data and saves it to the database' do
      employee = Employee.new
      expect(Employee).to receive(:new) { employee }
      expect(employee).to receive(:save)

      BambooHR::Sync.create_employee(employee_data)
    end
  end
end
