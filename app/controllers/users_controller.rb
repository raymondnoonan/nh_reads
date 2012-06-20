class UsersController < ApplicationController
before_filter :authenticate_user!
helper_method :sort_column, :sort_direction

  def show
    @user = current_user
    @orders = current_user.orders.order(sort_column + ' ' + sort_direction) #TODO: secure from SQL injection
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

  private
  def sort_column
    params[:sort] || "user"
  end

  def sort_direction
    params[:direction] || "asc"
  end
end
