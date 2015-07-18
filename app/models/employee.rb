class Employee < ActiveRecord::Base
  has_one :saving_company
  has_one :saving_employee
  has_one :salary
  has_one :total_amount
  has_one :history_transaction

  scope :inactive, -> { where( status: false )}
  scope :active, -> { where(status: true )}

  def self.from_omniauth(auth)
    where(email: auth.info.email ).first do |employee|
      employee.provider = auth.provider
      employee.uid      = auth.uid
      employee.save
    end
  end
end
