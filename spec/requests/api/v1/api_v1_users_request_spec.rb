require 'rails_helper'

RSpec.describe 'api/v1/users', type: :request do
  describe 'api/v1/users/:id' do
    let!(:user) { create(:user, :cool_username) }

    it 'responds with invalid request without JWT' do
      get "/api/v1/users/#{User.last.username}"
      expect(response).to have_http_status 401
      expect(response.body).to match(/Invalid token/)
    end

    it 'responds with JSON with JWT' do
      dynamic_route = 'cool_username'
      token = JsonWebToken.encode(user_id: user.id)
      get "/api/v1/users/#{dynamic_route}", headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status 200

      json_response = response.parsed_body
      expect(json_response.length).to eq 1
    end
  end
end
