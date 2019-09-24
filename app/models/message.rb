class Message < ApplicationRecord
  belongs_to :user
  belongs_to :message_room

  validates_presence_of :body, :user_id, :message_room_id
end
