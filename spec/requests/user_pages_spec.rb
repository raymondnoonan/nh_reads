require 'spec_helper'

describe "User pages" do 
	let(:user) { FactoryGirl.create(:user) }
	let!(:order_1) { FactoryGirl.create(:order) }
	let!(:order_2) { FactoryGirl.create(:order) }
	subject { page }

	describe "authorization" do
	  describe "as un-signed-in user" do
	    describe "visiting a Profile page" do
		  before { visit user_path(user) }

		  it { should have_content('Sign in') }
		  it { should_not have_content(user.email) }
		  end
	    end

	  describe "as signed-in user" do
	    before do
	      visit new_user_session_path
	      fill_in "Email", with: user.email
	      fill_in "Password", with: user.password
	      click_button "Sign in"
	    end

	    describe "Profile page" do
	      before { visit user_path(user) }
		  it { should have_content(user.email) }
	    end

	    describe "displaying orders" do
	    	it "should display the correct attributes of the orders" do
	    	  user.orders.each do |order|
	    	  	page.should have_selector('td', content: order.eta)
	    	  	page.should have_selector('td', content: order.created_at)
	    	  end
	    	end
	    end
      end
    end
end