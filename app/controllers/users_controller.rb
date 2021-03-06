class UsersController < ApplicationController
  include OrdersHelper # for verify_admin functionality
  before_filter :authenticate_user!
  before_filter :verify_admin!, :only => [:statistics]

  def statistics
    params[:month] ||= Time.now.strftime("%b %Y")
    parsed_month = Chronic.parse(params[:month])
    @current_orders = User.months_with_book_orders
    @data = User.books_for_month(parsed_month)
  end

  def history
    respond_to do |format|
      format.html
      format.json { render json: OrdersDatatable.new(view_context) }
    end
  #  @orders = current_user.orders.where(:completed => true).paginate(:per_page => 5, :page => params[:page])
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
