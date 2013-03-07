FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobartest"
    password_confirmation "foobartest"
  end
end