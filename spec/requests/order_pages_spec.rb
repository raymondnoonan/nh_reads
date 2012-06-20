require 'spec_helper'

describe "Order pages" do 
	let(:user) { FactoryGirl.create(:user) }
	subject { page }

	shared_examples_for "all invalid attempts" do
		it "should not create an order" do
		  expect { click_button "Create Order" }.should_not change(Order, :count)
		end
	end


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
		  before { visit new_order_path }

		  it { should have_selector('title', text: 'New Order') }

		  describe "with invalid information" do
		    describe "with all fields blank" do
			  	it_should_behave_like "all invalid attempts"
		    end

		    describe "with only ETA blank" do
		   	  before { fill_in "Quantity of Books", with: 5 }
	
		  	  	it_should_behave_like "all invalid attempts"
		    end

		    describe "with only quantity blank" do
		      before { fill_in "Estimated Time of Arrival", with: "6/12/2009 3:30 pm" }
		
		      	it_should_behave_like "all invalid attempts"
		    end

		    describe "with ETA valid and quantity invalid (as a negative number)" do
		    	before do
		    	 fill_in "Estimated Time of Arrival", with: "6/12/2009 3:30 pm"
		    	 fill_in "Quantity of Books", with: "-2"
		    	end
		    	it_should_behave_like "all invalid attempts"
		    end

		    describe "with ETA invalid and quantity valid" do
		    	before do
		    		fill_in "Estimated Time of Arrival", with: "-me+Ci/ow%wef"
		    		fill_in "Quantity of Books", with: "5"
		    	end

		    	it_should_behave_like "all invalid attempts"
		    end
		  end

		  describe "with valid information" do
		  	before do
		  		fill_in "Estimated Time of Arrival", with: "2/4/1993 3:32 AM"
		  		fill_in "Quantity of Books", with: "5"
		  	end

		  	it "should go through successfully" do
		  		expect { click_button "Create Order" }.should change(Order, :count).by(1)
		  	end
		  end
		end
	end
end