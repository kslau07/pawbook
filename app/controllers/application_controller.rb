class ApplicationController < ActionController::Base
  # Check token located in headers
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      @decoded = JsonWebToken.decode(header)
      # TODO: Delete me @decoded looks like:
      #     {"user_id"=>11, "exp"=>1700073572}

      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: 'Invalid token' }, status: :unauthorized # Use generic message instead
      # render json: { errors: e.message }, status: :unauthorized
    end
  end

  # Custom layout for Devise
  # SOURCE: https://github.com/heartcombo/devise/wiki/How-To:-Create-custom-layouts
  # ./posts_controller.rb
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller? && action_name == 'new'
      'devise'
    else
      'application'
    end
  end
end
