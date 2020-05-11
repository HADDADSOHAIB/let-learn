FactoryBot.define do
  factory :user do
    sequence :id
    username { "UserTest#{id}" }
    fullname { 'UserTest' }
    email { "usertest#{id}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
