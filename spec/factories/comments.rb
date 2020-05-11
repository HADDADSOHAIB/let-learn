FactoryBot.define do
  factory :comment do
    association :thought, factory: :thought, strategy: :create
    association :user, factory: :user, strategy: :create

    text { 'test comment' }
  end
end
