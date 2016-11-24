FactoryGirl.define do
    factory :user do
      first_name "MyString"
      last_name "MyString"
      password "MyString"
      sequence(:email) do |n|
        SecureRandom.uuid+n.to_s+"@126.COM"
      end



  end
end
