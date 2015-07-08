class CreateTotalAmounts < ActiveRecord::Migration
  def change
    create_table :total_amounts do |t|
      t.references :employee, index: true
      t.decimal :total_company
      t.decimal :total_employee
      t.decimal :total
      t.timestamps null: false
    end
  end
end
