FactoryGirl.define do


  factory :message do
    association :pet, factory: :pet
    body "MyString"

  end
end
