class UsersController < ApplicationController
before_filter :authenticate_user!
  def statistics
    @user = current_user
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
  	if @user.update_attributes(params[:user])
  		flash[:success] = "Profile updated"
  		redirect_to root_path
  	else
  		render 'edit'
  	end
  end
end
