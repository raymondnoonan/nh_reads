class OrdersController < ApplicationController
	before_filter :authenticate_user!

	def new
		@user = current_user
		@order = Order.new
		@line_items = LineItem.new
	end
end