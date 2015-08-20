module Initialize
  class Initialize_saving_employees
    def self.saving_employees
      employee = Employee.all
      employee.each do |data|
        create_saving_employee(data)
      end
    end

    def self.create_saving_employee(data)
      amount_data = {
        employee_id: data['id'],
        amount: 0.0
      }
      saving_employee = SavingEmployee.create_with(amount_data).find_or_initialize_by(employee: data)
      print '.' if saving_employee.save(validate: false)
    end
  end
end
