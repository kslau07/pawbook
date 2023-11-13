class Api::V1::BadRequestsController < ApplicationController
  skip_forgery_protection

  def not_found
    render json: { error: 'not_found' }
  end
end
