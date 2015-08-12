describe EmployeesController, type: :feature do
  describe "#edit" do
    it "should update employees attributes" do
      FactoryGirl.create(:admin, id: 2, email: 'john@crowdint.com', name: 'Jonh Doe', is_admin: true)
      FactoryGirl.create(:salary, id: 2, employee_id: 2, amount: 0.0)
      FactoryGirl.create(:saving_company, id: 2, employee_id: 2, amount: 0.0)
      FactoryGirl.create(:saving_employee, id: 2, employee_id: 2, amount: 0.0)
      visit root_path
      click_link("Sign in with your crowdint account")
      visit('/employees/2/edit')
      find('#employee_paypal_email').set('john@paypal.com')
      find('#employee_salary_attributes_amount').set('2000.0')
      find('#employee_saving_company_attributes_amount').set('3.1')
      find('#employee_saving_employee_attributes_amount').set('2.9')
      first('.form-update-employee__submit-btn').click
      visit('/employees/2/edit')
      expect(page).to have_selector("input[value='john@paypal.com']")
      expect(page).to have_selector("input[value='2000.0']")
      expect(page).to have_selector("input[value='3.1']")
      expect(page).to have_selector("input[value='2.9']")
      end
    end
  end
