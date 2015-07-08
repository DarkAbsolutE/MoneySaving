class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
	t.string :names
	t.string :lastname
	t.string :email
	t.string :paypal_email
	t.boolean :is_admin, default: false
	t.boolean :status, default: false
    end
  end
end
