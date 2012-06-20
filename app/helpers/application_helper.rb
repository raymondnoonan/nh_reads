module ApplicationHelper
	def sortable(column, title = nil)  #TODO: secure from SQL injection
		title ||= column.titleize
		direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
		link_to title, :sort => column, :direction => direction
	end
end
