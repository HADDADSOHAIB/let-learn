FactoryBot.define do
  factory :join_user_room do
    association :room, strategy: :create
    association :user, strategy: :create
  end
end
