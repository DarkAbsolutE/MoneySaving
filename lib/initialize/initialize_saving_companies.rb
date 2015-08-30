module Initialize
  class Initialize_saving_companies
    def self.saving_companies
      employee = Employee.all
      employee.each do |data|
        create_saving_company(data)
      end
    end

    def self.create_saving_company(data)
      amount_data = {
        employee_id: data['id'],
        amount: 0.0
      }
      saving_company = SavingCompany.create_with(amount_data).find_or_initialize_by(employee: data)
      print '.' if saving_company.save(validate: false)
    end
  end
end
