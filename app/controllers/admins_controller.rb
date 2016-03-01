class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  private

  def user_params
    params.require(:admin).permit(:username, :email, :password, :password_confirmation)
  end
end
