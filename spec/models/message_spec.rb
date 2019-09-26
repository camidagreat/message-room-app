require 'rails_helper'

RSpec.describe Message, type: :model do
  # validates the presence of required model fields before save
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:message_room_id) }
end
