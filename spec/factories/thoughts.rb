FactoryBot.define do
  factory :thought do
    association :author, factory: :user, strategy: :create

    text { 'this a test thought' }
  end
end
