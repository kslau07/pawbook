# NOTE: delete me or rename me
# When writing them, try to answer the question,
# “For a given HTTP request (verb + path + parameters), what HTTP response should the application return?”

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end
end
