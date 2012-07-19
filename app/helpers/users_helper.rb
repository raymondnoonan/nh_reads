module UsersHelper
	def verify_admin!
		unless current_user.admin?
			flash[:error] = "You are not authorized to view that page."
			redirect_to root_path
		end
	end
end
