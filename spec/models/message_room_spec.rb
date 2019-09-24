require 'rails_helper'

RSpec.describe MessageRoom, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:creator_id) }
end
