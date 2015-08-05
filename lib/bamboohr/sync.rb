module BambooHR
  class Sync
    def self.employees
      employees = client.employee_list
      employees['employees'].each do |data|
        employee = create_employee(data)
	create_salary(employee.id) if employee
	create_saving_employee(employee.id) if employee
	create_saving_company(employee.id) if employee
      end
    end

    def self.create_employee(data)
      user_data = {
        name: data['firstName'],
        lastname: data['lastName'],
	status: true,
	is_admin: is_admin?(data)
      }
      if importable?(data)
        employee = Employee.create_with(user_data).find_or_initialize_by(email: data['workEmail'])
        print '.' if employee.save(validate: false)
      end

      employee
    end

    def self.create_salary(id)
      amount_data = {
        employee_id: id,
        amount: 0.00
      }
      salary = Salary.create_with(amount_data).find_or_initialize_by(employee_id: id)
      print '.' if salary.save(validate: false)
    end

    def self.create_saving_employee(id)
      amount_data = {
        employee_id: id,
        amount: 3.0
      }
      saving_employee = SavingEmployee.create_with(amount_data).find_or_initialize_by(employee_id: id)
      print '.' if saving_employee.save(validate: false)
    end

    def self.create_saving_company(id)
      amount_data = {
        employee_id: id,
        amount: 3.0
      }
      saving_company = SavingCompany.create_with(amount_data).find_or_initialize_by(employee_id: id)
      print '.' if saving_company.save(validate: false)
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

    def self.is_admin?(data)
      if data['workEmail'] == ENV['EMAIL_ADMIN']
        true
      else
        false
      end
    end
  end
end
