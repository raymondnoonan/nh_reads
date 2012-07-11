FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"
    organization "Yale University"
  end

  factory :order do
    eta Time.now
    user
  end

  factory :line_item do
    quantity 5
    genre "Science Fiction"
    order
  end
end