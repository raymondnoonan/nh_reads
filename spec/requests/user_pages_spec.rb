require 'spec_helper'

describe "User pages" do 
	let(:user) { FactoryGirl.create(:user) }
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
      end
    end
end