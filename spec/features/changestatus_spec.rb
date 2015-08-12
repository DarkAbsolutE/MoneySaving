require 'spec_helper'
feature 'changestatus' do
	background do
		FactoryGirl.create(:admin, email: 'john@crowdint.com', name: 'Jonh Doe', is_admin: true, id: 1)
		visit root_path
		click_link("Sign in with your crowdint account")
		expect(page).to have_content "Signed in as Jonh Doe!"
	end

	scenario "User should be able to change status" do
		click_link("Employees")
		expect(page).to have_content "Active Employees"
		click_link ""['btn ac']
		expect(page).to have_content "Inactive Employees"
		click_link ""['btn in']
	end
end
