# When writing request specs, try to answer the question:
# “For a given HTTP request (verb + path + parameters),
# what HTTP response should the application return?”

require 'rails_helper'

# How to write request specs:
# https://dev.to/kevinluo201/introduce-rspec-request-spec-4pbl

RSpec.describe 'api/v1/posts', type: :request do
  let(:test_user) { create(:user) }

  describe 'GET /posts' do
    it 'responds with invalid request without JWT' do
      get api_v1_posts_url
      expect(response).to have_http_status 401
      expect(response.body).to match(/Invalid token/)
    end

    it 'it responds with JSON with JWT' do
      token = JsonWebToken.encode(user_id: test_user.id)
      get api_v1_posts_url, headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status 200
    end
  end
end
