class PagesController < ApplicationController
  def home
    if user_signed_in?
      if current_user.role == 'admin'
        redirect_to admin_root_path
      else
        render 'home/user'
      end
    else
      redirect_to new_user_session_path
    end
  end
end
