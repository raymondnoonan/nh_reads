FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"
    organization
  end

  factory :order do
    eta Time.now
    user
  end

  factory :organization do
    name "NHR"
    address_street "123 Main Street"
    address_town "New Haven"
    address_state "CT"
  end

  factory :line_item do
    quantity 5
    order
  end
end