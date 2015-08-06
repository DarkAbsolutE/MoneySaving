describe EmployeesController, type: :feature do

   	describe "#edit" do
      it "should have Active Employees text" do
        FactoryGirl.create(:admin, id: 1, email: 'john@crowdint.com', name: 'Jonh Doe', is_admin: true)
        FactoryGirl.create(:salary, id: 1, employee_id: 1, amount: 0.0)
        visit root_path
  	    click_link("Sign in with your crowdint account")
        visit('/employees/1/edit')
        find('#employee_paypal_email').set('john@paypal.com')
        first('.form-update-employee__submit-btn').click
        visit('/employees/1/edit')
        find('#salary_amount').set('2000.0')
        first('.form-update-employee__submit-btn-salary').click
        visit('/employees/1/edit')
        expect(page).to have_selector("input[value='john@paypal.com']")
        expect(page).to have_selector("input[value='2000.0']")
        save_and_open_page
      end
    end

  end
