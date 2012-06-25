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
	      visit user_path(user)
	    end

	    describe "Profile page" do
	      before { visit user_path(user) }
	      it { should have_content(user.name) }
		  it { should have_content(user.email) }
	    end
      end
    end

    describe "attempting to sign in" do
    	describe "with all information incorrect" do
    	  before do
    	   visit new_user_session_path
    	   fill_in "Email", with: "fwefweqd"
    	   fill_in "Password", with: "hahahahaha"
    	   click_button "Sign in"
    	  end

    	  it { should have_content('Invalid') }
    	  it { should have_content('Sign in') }
    	end

      describe "with Email correct and password incorrect" do
      	before do
      	  visit new_user_session_path
      	  fill_in "Email", with: user.email
      	  fill_in "Password", with: "ffwweew232__."
      	  click_button "Sign in"
      	end

      	it { should have_content('Invalid') }
      	it { should have_content('Sign in') }
      end

      describe "with Email incorrect and password correct" do
      	before do
      		visit new_user_session_path
      		fill_in "Email", with: "9230fmmfe"
      		fill_in "Password", with: user.password
      		click_button "Sign in"
      	end

      	it { should have_content('Invalid') }
      	it { should have_content('Sign in') }
      end
    end
end