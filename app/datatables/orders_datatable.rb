# put all of this as_json logic in the model file

class OrdersDatatable
	delegate :params, :h, :link_to, :to => :@view

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
				link_to(order.organization, order_path(order)),
				h(order.total_books),
				h(order.eta.strftime("%b %e, %Y")),
				h(order.created_at.strftime("%b %e, %Y"))
			]
		end
	end

	def orders
		@orders ||= fetch_orders
	end

	def fetch_orders
		if sort_column == "organization"
			## insert logic for dealing with this here
		end
		orders = Order.order("#{sort_column} #{sort_direction}")
		orders = orders.page(page).per_page(per_page)
		if params[:sSearch].present?
			### TODO: implement texticle here ###
			orders = orders.where("total_books like :search or eta like :search or 
				created_at like :search or organization like :search", search: "%#{params[:sSearch]}%" ) 
		end
		orders
	end

	def page
		params[:iDisplayStart].to_i/per_page + 1
	end

	def per_page
		params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
	end

	def sort_column
		columns = %w[organization total_books eta created_at]
		columns[params[:iSortCol_0].to_i]
	end

	def sort_direction
		params[:sSortDir_0] == "desc" ? "desc" : "asc"
	end
end






