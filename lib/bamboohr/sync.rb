module BambooHR
  class Sync
    def self.employees
      employees = client.employee_list
      id = 1
      employees['employees'].each do |data|	
        create_employee(data)
	create_salary(id)
	create_saving_employee(id)
	create_saving_company(id)
	id = id + 1
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

    def self.create_salary(id)
	salary = Salary.create_with(amount: 0).find_or_initialize_by(employee_id: id)
	print '.' if  salary.save(validate: false)	
    end

    def self.create_saving_employee(id)
	#saving_employee =
    end

    def self.create_saving_company(id)
	#saving_campany =
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
