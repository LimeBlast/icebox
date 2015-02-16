FactoryGirl.define do
  factory :user do
    email 'email@example.com'
    password 'thisismyexamplepassword'
    password_confirmation { password }
  end
end
