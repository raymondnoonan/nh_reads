# put all of this as_json logic in the model file

class OrdersDatatable
	delegate :params, :h, :link_to, :order_path, :current_user, :to => :@view
	def initialize(view)
		@view = view
	end

	def as_json(options = {})
		{
			sEcho: params[:sEcho].to_i,
			iTotalRecords: Order.count,
			iTotalDisplayRecords: orders.total_entries,
			aaData: data
		}
	end

private

	def data
		orders.map do |order|
			[
				link_to(order.solicitor, order_path(order)),
				h(order.destination),
				h(order.eta.strftime("%b %e, %Y")),
				h(order.created_at.strftime("%b %e, %Y"))
			]
		end
	end

	def orders
		@orders ||= fetch_orders
	end

	def fetch_orders
		if current_user.admin?  # if the current user is an admin, fetch all of the orders
		  if params[:action] == "index"
		    orders = Order.where(:completed => false).order("#{sort_column} #{sort_direction}")
		  else
		  	orders = Order.where(:completed => true).order("#{sort_column} #{sort_direction}")
		  end
		else                  # if the current user is not an admin, only fetch the orders that correspond to that user's id
		  if params[:action] == "index"
		    orders = Order.where("completed = ? AND user_id = ?", false, current_user.id).order("#{sort_column} #{sort_direction}")
		  else
		  	orders = Order.where("completed = ? AND user_id = ?", true, current_user.id).order("#{sort_column} #{sort_direction}")
		  end
		end
		orders = orders.page(page).per_page(per_page)
		if params[:sSearch].present?
			orders = orders.search(params[:sSearch]) 
		end
		orders
	end

	def page
		params[:iDisplayStart].to_i/per_page + 1
	end

	def per_page
		params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 5
	end

	def sort_column
		columns = %w[solicitor destination eta created_at]
		columns[params[:iSortCol_0].to_i]
	end

	def sort_direction
		params[:sSortDir_0] == "desc" ? "DESC" : "ASC"
	end
end






