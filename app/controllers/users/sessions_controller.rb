class Users::SessionsController < Devise::SessionsController
  def profile
    @user = current_user
  end
  end