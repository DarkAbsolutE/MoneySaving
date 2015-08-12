class SavingCompany < ActiveRecord::Base
   belongs_to :employee
   accepts_nested_attributes_for :employee
end
