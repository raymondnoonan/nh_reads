class OrdersController < ApplicationController
	include OrdersHelper # for verify_admin functionality
	
	before_filter :authenticate_user!
	before_filter :verify_admin!, :only => [:toggle, :print, :delete]

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

	def create
		# if the user is not an admin (i.e. didn't have the option to input a value for solicitor), make the
		# solicitor the user himself.
		if params[:order][:solicitor].blank?
			params[:order][:solicitor] = current_user.organization
		end

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
	  respond_to do |format|
	  	format.html
	  	format.json { render json: OrdersDatatable.new(view_context) }
	  end
	end

	def delete
		unless params[:destroy_all_completed]  # if the "destroy all completed orders" button wasn't clicked, just destroy
		  @order = Order.find(params[:id])	   # the one order
		  @order.destroy
		  flash[:success] = "Order deleted!"
		else								   # otherwise, destroy all of the orders that have been completed
		  @completed_orders = Order.where(:completed => true)
		  @completed_orders.each do |order|
		  	order.destroy
		  end
		  flash[:success] = "All completed orders deleted!"
		end
		redirect_to root_path
	end
end