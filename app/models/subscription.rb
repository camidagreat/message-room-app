class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :message_room

  validates_presence_of :user_id, :message_room_id
end
