class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
	t.string :name
	t.string :paypal_email
	t.boolean :is_admin, default: false
	t.boolean :active, default: false
    end
  end
end
