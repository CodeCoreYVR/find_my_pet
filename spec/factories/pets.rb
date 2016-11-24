FactoryGirl.define do



  factory :pet do
    association :user, factory: :user
    pet_type "MyString"
    name "MyString"
    color "MyString"
    gender "MyString"
    last_seen_at Time.now

  end
end
