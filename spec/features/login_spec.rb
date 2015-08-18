require 'spec_helper'

feature 'Login' do
  background do
    FactoryGirl.create(:admin, email: 'john@crowdint.com', name: 'Jonh Doe', is_admin: true)
  end

  scenario "User should be able to login" do
    visit root_path
    expect(page).to have_content "Welcome to Savings"
    expect(page).to have_content "Sign in with your crowdint account"
    click_link("Sign in with your crowdint account")
    expect(page).to have_content "Signed in as Jonh Doe!"
  end

end
