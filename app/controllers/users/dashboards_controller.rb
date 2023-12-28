class Users::DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    # @model_class_name = ModelClassName.find(params[:id])
    #
  end
end
