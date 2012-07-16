require 'spec_helper'

describe "User pages" do 
	let(:user) { FactoryGirl.create(:user) }
	let!(:order_1) { FactoryGirl.create(:order, user: user) }
	let!(:order_2) { FactoryGirl.create(:order, user: user) }
  let!(:order_next_month) { FactoryGirl.create(:order, eta: "1/12/2091", user: user) }
  let!(:line_item_1) { FactoryGirl.create(:line_item, order: order_1) }
  let!(:line_item_2) { FactoryGirl.create(:line_item, order: order_2) }
  let!(:line_item_next_month) { FactoryGirl.create(:line_item, order: order_next_month) }
	subject { page }

  describe "statistics" do
    describe "visiting statistics page" do
      before do
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in" 
        visit statistics_user_path(user) 
      end

      it { should have_selector('h1', text: 'Statistics') }
    end
  end

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

      describe "with both Email and password correct" do
        before do
         visit new_user_session_path
         fill_in "Email", with: user.email
         fill_in "Password", with: user.password
         click_button "Sign in" 
       end

       it { should have_selector('h1', text: 'Your Pending Orders') }
      end
    end
  end
end