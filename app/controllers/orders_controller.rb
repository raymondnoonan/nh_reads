class OrdersController < ApplicationController
	before_filter :authenticate_user!

	def toggle
		@order = Order.find(params[:id])
		@order.toggle!(:completed)
		redirect_to print_order_path(@order)
	end

	def show
		@user = current_user
		@order = Order.find(params[:id])
	end

	def print
		@user = current_user
		@order = Order.find(params[:id])
	end

	def new
		@user = current_user      # for sidebar
		@order = Order.new        # for error messages
		@autocomplete_items = LineItem::AllGenresTitled
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

	def update
		@user = current_user
		@order = Order.find(params[:id])
		if @order.update_attributes(params[:order])
			flash[:success] = "Order updated"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@user = current_user
		@order = Order.find(params[:id])
	end

	def index
		@user = current_user
		@orders = current_user.orders.count
		respond_to do |format|
    	  format.html
    	  format.json { render :json => OrdersDatatable.new(view_context) }
  	    end
	end

	def history
		@user = current_user
		@orders = current_user.orders.paginate(:per_page => 5, :page => params[:page])
	end

	def delete
		@order = Order.find(params[:id])
		@order.destroy
		flash[:success] = "Order deleted!"
		redirect_to orders_path
	end
end