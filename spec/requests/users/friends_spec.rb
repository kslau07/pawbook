require 'rails_helper'

RSpec.describe "Users::Friends", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users/friends/index"
      expect(response).to have_http_status(:success)
    end
  end

end
