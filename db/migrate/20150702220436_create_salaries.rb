class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.references :employee, index: true
      t.decimal :amount
      t.timestamps null: false
    end
  end
end
