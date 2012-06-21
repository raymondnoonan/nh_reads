class OrdersController < ApplicationController
	before_filter :authenticate_user!

	def new
		@user = current_user
		@order = Order.new
		@line_item = LineItem.new
		@autocomplete_items = LineItem::AdultGenresTitled + LineItem::ChildGenresTitled
	end

	def create
		@user = current_user # for the sidebar
		@order = current_user.orders.build(params[:order])
		@line_item = @order.line_items.build(params[:line_item])
		if @order.save
		  flash[:success] = "Order created"
		  redirect_to root_path
		else
		  render 'new'
		end
	end
end