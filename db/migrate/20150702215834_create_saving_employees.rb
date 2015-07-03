class CreateSavingEmployees < ActiveRecord::Migration
  def change
    create_table :saving_employees do |t|
     	t.references :employee, index: true
	t.decimal :amount
 	t.timestamps null: false
    end
  end
end
