# When writing request specs, try to answer the question:
# “For a given HTTP request (verb + path + parameters),
# what HTTP response should the application return?”

require 'rails_helper'

# How to write request specs:
# https://dev.to/kevinluo201/introduce-rspec-request-spec-4pbl
#
#  TODO: Enable signing up and signing in through the api (and Postman)
# https://wajeeh-ahsan.medium.com/rails-user-authentication-with-devise-and-simple-token-authentication-7beafd1bb863
#

RSpec.describe 'api/v1/posts', type: :request do
  # RSpec.describe '/events', type: :request do
  # describe 'GET /index' do
  #   it 'renders a successful response' do
  #     Event.create! valid_attributes
  #     get events_url
  #     expect(response).to have_http_status :ok
  #   end
  # end

  # describe 'GET /index' do
  #   xit 'returns status code 200' do
  #     get api_v1_posts_path
  #     # get api_v1_posts_url
  #     expect(response).to have_http_status :ok
  #   end
  # end
end
