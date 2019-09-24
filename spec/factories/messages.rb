FactoryBot.define do
  factory :message do
    body { "MyString" }
    user_id { 1 }
    message_room_id { 1 }
  end
end
