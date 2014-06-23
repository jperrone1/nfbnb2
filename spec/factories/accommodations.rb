# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :accommodation do
    price 1000
    description "Beautiful views and lots of sun."
    listing_type "Private room"
    city "San Francisco"
    address1 "145 Moreland Street"
    state "California"
    zip "94131"
    phone "(415)555-1212"
  end
end
