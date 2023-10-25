RSpec.shared_context :devise_login do
  let(:user) { create(:user) }
  before { devise_login_as user }

  def devise_login_as(user)
    post user_session_path, params:
      { user: { email: user.email, password: user.password } }
  end

  # let(:user) { create(:user) }
  # before { devise_login_as user }
  # Login through devise
  # def devise_login_as(user)
  #   post user_session_path, params:
  #     { user:
  #          { email: user.email,
  #            password: user.password } }
  #   follow_redirect!
  # end
end
