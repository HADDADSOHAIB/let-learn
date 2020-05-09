FactoryBot.define do
  factory :like do
    association :thought, strategy: :create
    association :user, strategy: :create
  end
end