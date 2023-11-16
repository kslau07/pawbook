require 'rails_helper'

RSpec.describe 'api/v1/posts', type: :request do
  let!(:test_user) { create(:user) }

  describe '/api/v1/posts' do
    it 'responds with invalid request without JWT' do
      get '/api/v1/posts'
      expect(response).to have_http_status 401
      expect(response.body).to match(/Invalid token/)
    end

    it 'responds with JSON with JWT' do
      posts = create_list(:post, 3, :text_content)
      token = JsonWebToken.encode(user_id: test_user.id)
      get '/api/v1/posts', headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status 200

      json_response = response.parsed_body
      expect(json_response.length).to eq 3
    end
  end

  describe '/api/v1/posts/:id' do
    it 'responds with JSON with JWT' do
      text_post = create(:text_post)
      token = JsonWebToken.encode(user_id: test_user.id)
      get "/api/v1/posts/#{text_post.id}", headers: { 'Authorization' => "Bearer #{token}" }
      expect(response).to have_http_status 200

      json_response = response.parsed_body
      expect(json_response.length).to eq 1
    end
  end
end
