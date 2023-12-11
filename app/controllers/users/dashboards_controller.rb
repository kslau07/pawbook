class Users::DashboardsController < ApplicationController
  def show
    @user = current_user
    # @model_class_name = ModelClassName.find(params[:id])
    #
  end
end
