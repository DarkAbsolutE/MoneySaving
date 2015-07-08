class CreateSavingCompanies < ActiveRecord::Migration
  def change
    create_table :saving_companies do |t|
	t.references :employee, index: true
	t.decimal :amount
	t.timestamps
    end
  end
end
