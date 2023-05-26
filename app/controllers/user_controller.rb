class UserController < ApplicationController
  def show
    @user = current_user if current_user.role == 'user'
    if user_signed_in?
      if current_user.role == 'admin'
        redirect_to admin_root_path
      else
        render 'user/show'
      end
    else
      redirect_to new_user_session_path
    end
  end

  def referral
    @user = current_user if current_user.role == 'user'
  end

end
