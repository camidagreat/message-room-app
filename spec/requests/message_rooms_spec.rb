require 'rails_helper'

RSpec.describe "MessageRooms", type: :request do
  describe "GET /message_rooms" do
    it "works! (now write some real specs)" do
      get message_rooms_path
      expect(response).to have_http_status(200)
    end
  end
end
