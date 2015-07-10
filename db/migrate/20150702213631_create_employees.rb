class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
	t.string :provider
	t.string :uid

	t.string :names
	t.string :lastname
	t.string :email
	t.string :paypal_email

	t.string :oauth_token
        t.datetime :oauth_expires_at

       	t.boolean :is_admin, default: false
	t.boolean :status, default: false

	t.timestamps null: false
    end
  end
end
