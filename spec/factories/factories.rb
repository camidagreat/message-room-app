FactoryBot.define do
  factory :message_room do
    title { "MyString" }
    blurb { "MyString12 2390 2093 0293 23" }
    creator_id { 1 }
  end

  factory :message do
    body { "MyString" }
    user_id { 1 }
    message_room_id { 1 }
  end

  factory :subscription do
    user_id { 1 }
    message_room_id { 1 }
  end

  factory :user do
    email { "test@test.com" }
    username { "testthisapp" }
    first_name { "Test" }
    last_name { "Testy" }
    password { "password" }
  end
end
