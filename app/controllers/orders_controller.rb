class OrdersController < ApplicationController
	before_filter :authenticate_user!
	before_filter :verify_admin!, :only => [:toggle, :print, :delete]
	include OrdersHelper # for verify_admin functionality

	def toggle
		@order = Order.find(params[:id])
		@order.toggle!(:completed)
		redirect_to print_order_path(@order)
	end

	def show
		@order = Order.find(params[:id])
	end

	def print
		@order = Order.find(params[:id])
	end

	def new                       # for sidebar
		@order = Order.new        # for error messages
		@autocomplete_items = LineItem::AllGenresTitled
	end

	def create # for sidebar
		@order = current_user.orders.build(params[:order])
		if @order.save
		  flash[:success] = "Order created"
		  redirect_to root_path
		else
		  render 'new'
		end
	end

	def update
		@order = Order.find(params[:id])
		if @order.update_attributes(params[:order])
			flash[:success] = "Order updated"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@order = Order.find(params[:id])
	end

	def index
		@orders = current_user.orders.paginate(page: params[:page], :per_page => 10)
	end

	def delete
		@order = Order.find(params[:id])
		@order.destroy
		flash[:success] = "Order deleted!"
		redirect_to root_path
	end
end