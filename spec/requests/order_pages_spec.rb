require 'spec_helper'

describe "Order pages" do 
	let(:user) { FactoryGirl.create(:user) }
	subject { page }

	describe "not signed in" do
		before { visit new_order_path }

		it { should have_content('Sign in') }
	end

	describe "signed in" do
	  before do
	    visit new_user_session_path
	    fill_in "Email", with: user.email
	    fill_in "Password", with: user.password
	    click_button "Sign in"
      end

	  describe "creating a new order" do
		before { visit new_order_path(user) }

		it { should have_selector('title', text: 'New Order') }
	  end
	end
end