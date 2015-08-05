FactoryGirl.define do

  factory :employee do
    name     { FFaker::Name.name }
    lastname { FFaker::Name.last_name }
    sequence(:email) { FFaker::Internet.email }
  end

end
