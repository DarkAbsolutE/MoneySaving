class Employee < ActiveRecord::Base
  has_one :saving_company
  has_one :saving_employee
  has_one :salary
  has_one :total_amount
  has_one :history_transaction
end
