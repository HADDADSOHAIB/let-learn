FactoryBot.define do
  factory :message do
    association :room, strategy: :create
    association :user, strategy: :create
    body { 'message body' }
  end
end
