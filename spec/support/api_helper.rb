# spec/support/api_helper.rb
module ApiHelper
  # TODO: Clean up this File

  # JWT Flow
  # 1. signup -> users/registrations#create
  # 2. login -> users/sessions#create
  # 2b.    pass user_id to JsonWebToken.encode
  # 3. encode -> Call JWT.encode, include user_id & exp only
  # 4. Return json with encrypted token, json itself is only encoded
  # 5. Try to get /posts, get routed to authorize_request
  # 6. authorize_request -> Check request headers for bearer token
  # 6a. If valid token return value is @current_user

  # JWT Flow (fnames)
  # 1. user/registrations_controller.rb
  # 2. user/sessions_controller.rb
  # 3. lib/json_web_token.rb
  # 3a.     methods-> encode, decode
  # 4. application_controller.rb
  # 4a.     methods-> authorize_request

  # def authenticated_header(request, user)
  #   token = Knock::AuthToken.new(payload: { sub: user.id }).token
  #   request.headers.merge!('Authorization': "Bearer #{token}")
  # end

  def get_token(user)
    # user = find_user

    # if user&.valid_password?(login_params[:password])
    token = JsonWebToken.encode(user_id: user.id)
    # time = Time.zone.now + 24.hours.to_i
    # render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
    # username: user.username }, status: :ok
    # end
  end
end
