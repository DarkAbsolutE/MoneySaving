module Initialize
  class Initialize_salaries
    def self.salaries
      employee = Employee.all
      employee.each do |data|
        create_salary(data)
      end
    end

    def self.create_salary(data)
      amount_data = {
        employee_id: data['id'],
        amount: 0.0
      }
      salary = Salary.create_with(amount_data).find_or_initialize_by(employee: data)
      print '.' if salary.save(validate: false)
    end
  end
end
