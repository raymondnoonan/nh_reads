class UsersController < ApplicationController
before_filter :authenticate_user!
  def statistics
    @data = User.books_for_this_month
  end

  def history
    @orders = current_user.orders.paginate(:per_page => 5, :page => params[:page])
  end

  def edit
  end

  def update
  	if current_user.update_attributes(params[:user])
  		flash[:success] = "Profile updated"
  		redirect_to root_path
  	else
  		render 'edit'
  	end
  end
end
