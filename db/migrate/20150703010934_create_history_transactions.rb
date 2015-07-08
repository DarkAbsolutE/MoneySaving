class CreateHistoryTransactions < ActiveRecord::Migration
  def change
    create_table :history_transactions do |t|
        t.references :employee, index: true
        t.string :name
        t.decimal :saving_employee
        t.decimal :saving_company
        t.decimal :salary 
        t.timestamps null: false
    end
  end
end
