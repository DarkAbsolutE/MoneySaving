module BambooHR
  class Sync
    def self.employees
      employees = client.employee_list
      employees['employees'].each do |data|
        create_employee(data)
      end
    end

    def self.create_employee(data)
      user_data = {
        name: data['firstName'],
        lastname: data['lastName'],
	status: true
        }
      if importable?(data)
        employee = Employee.create_with(user_data).find_or_initialize_by(email: data['workEmail'])
        print '.' if  employee.save(validate: false)
      end
    end

    def self.client
      unless @client
        @client = Client.new
        @client.key = ENV['BAMBOO_API_KEY']
        @client.subdomain = ENV['BAMBOO_SUBDOMAIN']
      end
      @client
    end

    def self.importable?(data)
      data['workEmail'].present?
    end
  end
end
