FactoryGirl.define do
  factory :employee do
    name     { FFaker::Name.first_name }
    lastname { FFaker::Name.last_name }
    sequence(:email) { FFaker::Name.first_name + "@crowdint.com" }
    is_admin false
    status true
  end

  factory :admin, parent: :employee do
    is_admin true
    status true
  end
end
