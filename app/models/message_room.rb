class MessageRoom < ApplicationRecord
  has_many :messages
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates_presence_of :title, :creator_id
end
