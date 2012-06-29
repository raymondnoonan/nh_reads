class StaticPagesController < ApplicationController
  def home
  	@user = current_user
  	if user_signed_in?
  		redirect_to orders_path
  	end
  end

  def signup
  end
end
