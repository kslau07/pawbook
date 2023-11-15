require 'rails_helper'

# When writing request specs, try to answer the question:
# “For a given HTTP request (verb + path + parameters),
# what HTTP response should the application return?”

# How to write request specs:
# https://dev.to/kevinluo201/introduce-rspec-request-spec-4pbl

RSpec.describe 'api/v1/users', type: :request do
  let!(:users) { create_list(:user, 3) }

  # TODO: Instead of :id we route by :username
  describe 'api/v1/users/:id' do
    it 'responds with invalid request without JWT' do
      get '/api/v1/users/1'
      expect(response).to have_http_status 401 # unauthorized
      expect(response.body).to match(/Invalid token/)
    end
  end
end
