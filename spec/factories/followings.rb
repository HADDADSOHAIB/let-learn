FactoryBot.define do
  factory :following do
    association :followed, factory: :user, strategy: :create
    association :follower, factory: :user, strategy: :create
  end
end
