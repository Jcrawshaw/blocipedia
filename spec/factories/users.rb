FactoryGirl.define do
  factory :user do
    name "User Name"
    email "user@example.com"
    password "secretkey"
    password_confirmation "secretkey"
  end

end
