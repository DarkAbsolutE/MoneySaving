require 'spec_helper'

feature 'changestatus' do
  background do
    login
  end

  scenario "User should be able to change status" do
    click_link("Employees")
    save_and_open_page
    binding.pry
    expect(page).to have_content "Active Employees"
    click_link ""['btn ac']
    expect(page).to have_content "Inactive Employees"
    click_link ""['btn in']
  end
end
