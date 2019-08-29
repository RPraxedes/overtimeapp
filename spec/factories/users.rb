FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user, class: "User" do
    first_name 'Jon'
    last_name 'Snow'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    type "User"
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end

  factory :unauthorized_user, class: "User" do
    first_name 'Not'
    last_name 'Snow'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end
end
