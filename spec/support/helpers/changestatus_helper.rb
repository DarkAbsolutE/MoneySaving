  def login
   FactoryGirl.create(:admin, email: 'john@crowdint.com', name: 'Jonh Doe', is_admin: true, id: 1)
   visit root_path
   click_link("Sign in with your crowdint account")
   expect(page).to have_content "Signed in as Jonh Doe!"
  end
