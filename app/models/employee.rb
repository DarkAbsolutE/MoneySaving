class Employee < ActiveRecord::Base
  has_one :saving_company
  has_one :saving_employee
  has_one :salary
  has_one :total_amount
  has_one :history_transaction

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |employee|
      employee.provider = auth.provider
      employee.uid      = auth.uid 
      employee.save
    end
  end
end
