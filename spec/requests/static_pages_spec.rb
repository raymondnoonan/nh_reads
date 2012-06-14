require 'spec_helper'

describe "Static pages" do
	subject { page }
	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_selector('title', text: title) }
	end

	describe "Home page" do
		before { visit root_path }
		let(:user) { FactoryGirl.create(:user) }
		
		describe "not signed in" do
		  let(:heading) { 'Welcome to the New Haven Reads Book Center' }
		  let(:title)   { 'Home' }

		  it_should_behave_like "all static pages"
		end

		describe "signed in" do
		  before do
		    visit new_user_session_path
	        fill_in "Email", with: user.email
	        fill_in "Password", with: user.password
	        click_button "Sign in"
	      end

	      it { should have_content('Home') }
	    end
	end
end
