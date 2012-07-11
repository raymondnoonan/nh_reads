require 'spec_helper'

describe "User pages" do 
	let(:user) { FactoryGirl.create(:user) }
	let!(:order_1) { FactoryGirl.create(:order, user: user) }
	let!(:order_2) { FactoryGirl.create(:order, user: user) }
	subject { page }

	describe "authorization" do
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
end