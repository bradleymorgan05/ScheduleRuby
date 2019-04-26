FactoryBot.define do
  factory :appointment do
    start_time {Faker::Number.between(0,50)}
    end_time {Faker::Number.between(51, 100)}
    description {Faker::Lorem.word}
    schedule_id {nil}
  end
end