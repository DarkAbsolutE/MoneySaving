describe EmployeesController, type: :controller do

  it 'should have Update Employee text' do
          #it 'updates employee successfully' do
          #    put :update, id: employee.id, employee: FactoryGirl.attributes_for(:employee)
          #    expect(response).to redirect_to (employees_path)
          #end
          visit('/employees')
          page.should have_content('Active Employees')
end


end
