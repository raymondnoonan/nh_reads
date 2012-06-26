class OrdersController < ApplicationController
	before_filter :authenticate_user!

	def print
		@user = current_user
		@order = Order.find(params[:id])
	end

	def new
		@user = current_user      # for sidebar
		@order = Order.new        # for error messages
		@order.line_items.build

		# for autocomplete
		@autocomplete_items = LineItem::AdultGenresTitled + LineItem::ChildGenresTitled
	end

	def show
		@user = current_user
		@order = Order.find(params[:id])
	end

	def create
		@user = current_user # for sidebar
		@order = current_user.orders.build(params[:order])
		if @order.save
		  flash[:success] = "Order created"
		  redirect_to root_path
		else
		  render 'new'
		end
	end

	def index
		@user = current_user
		@orders = current_user.orders.paginate(:per_page => 5, :page => params[:page])
	end

	def history
		@user = current_user
		@orders = current_user.orders.paginate(:per_page => 5, :page => params[:page])
	end
end