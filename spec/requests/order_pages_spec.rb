# TODO:
#   - Write test for a signed-in user attempting to visit another user's order index
#   - Write test for a user's order index
#   - Write test for user's order history

require 'spec_helper'

describe "Order pages" do 
	let(:user) { FactoryGirl.create(:user) }

	let!(:order_not_complete) { FactoryGirl.create(:order, user: user) }
	  let!(:line_item_1) { FactoryGirl.create(:line_item, order: order_not_complete) }
	  let!(:line_item_2) { FactoryGirl.create(:line_item, order: order_not_complete) }

	let!(:order_completed) { FactoryGirl.create(:order, user: user, completed: true) }
	  let!(:line_item_3) { FactoryGirl.create(:line_item, order: order_completed, genre: "Computers") }
	  let!(:line_item_4) { FactoryGirl.create(:line_item, order: order_completed, genre: "Romance") }

	subject { page }

	describe "not signed in" do
		describe "attempting to create a new order" do
		  before { visit new_order_path }

		  it { should have_content('Sign in') }
		end

		describe "attempting to visit an order show page" do
			before { visit order_path(order_not_complete) }

			it { should have_content('Sign in') }
		end

		describe "attempting to visit the order index page" do
			before { visit orders_path }

			it { should have_content('Sign in') }
		end
	end

	describe "signed in" do
	  before do
	    visit new_user_session_path
	    fill_in "Email", with: user.email
	    fill_in "Password", with: user.password
	    click_button "Sign in"
      end

      # Write printing tests:
        # Visit order show page
        # Hit print order page
        # Check that completed attribute changed
        # Find order show page again, hit print order button again, check that completed attribute has changed once again
        # Hit the print button one more time, check completed attribute one more time

      describe "printing an order" do
      	before do
      		visit order_path(order_not_complete)
      		click_link "Print"
      	end

      	# how to check if attribute changed?
      end

      describe "visiting an order show page" do
      	before { visit order_path(order_not_complete) }

      	it { should have_content(line_item_1.quantity) }
      	it { should have_content(line_item_2.quantity) }

      end

      describe "visiting a different order show page" do
      	before { visit order_path(order_completed) }

      	it { should have_content(line_item_3.quantity) }
      	it { should have_content(line_item_4.quantity) }
      end

      describe "visiting an order edit page" do
      	# Tests to write:
      	  # Editing each attribute individually
      	  # Editing more than one attribute at the same time
      	  # Editing attributes with correct and incorrect values
      end

      describe "visiting the orders index page" do
      	before { visit orders_path }

      	describe "with pending orders" do
      	  it { should have_selector('h1', text: "Your Pending Orders") }

      	  it { should have_content("Organization") }
      	  it { should have_content("Total Books") }
      	  it { should have_content("ETA") }
      	  it { should have_content("Entered On") }

      	  it { should have_content(user.organization.titleize) }
      	  it { should have_content(order_not_complete.total_books.to_s) }
      	end

      	describe "deleting orders" do
      		before { visit order_path(order_completed) }

      		it "should delete the order" do
      			expect { click_link "Delete" }.should change(Order, :count).by(-1)
      		end
      	end
      end

	  describe "creating a new order" do
		  before do 
		  	visit new_order_path
		  	click_link "Add Line Item"
		  end

		  it { should have_selector('title', text: 'New Order') }

		  describe "with invalid information" do

		    describe "with all fields blank" do
			  	it "should not create an order" do
		  		  expect { click_button "Create Order" }.should_not change(Order, :count)
				end
		    end

		    describe "with only ETA blank" do
		   	  before do
		   	   fill_in "Quantity of Books", with: "5"
		   	   fill_in "Genre", with: "Romance"
		   	  end
	
		  	  	it "should not create an order" do
		  		  expect { click_button "Create Order" }.should_not change(Order, :count)
				end
		    end

		    describe "with only quantity blank" do
		      before do 
		      	fill_in "Estimated Time of Arrival", with: "6/12/2009 3:30 pm"
		      	fill_in "Genre", with: "Romance"
		      end
		
		      	it "should not create an order" do
		  		  expect { click_button "Create Order" }.should_not change(Order, :count)
				end
		    end

		    describe "with only Genre blank" do
		    	before do
		    		fill_in "Estimated Time of Arrival", with: "6/12/2010 4:47 PM"
		    		fill_in "Quantity of Books", with: "7"
		    	end

		    	it "should not create an order" do
		    		expect { click_button "Create Order" }.should_not change(Order, :count)
		    	end
		    end

		    describe "with ETA valid and quantity invalid (as a negative number)" do
		    	before do
		    	 fill_in "Estimated Time of Arrival", with: "6/12/2009 3:30 pm"
		    	 fill_in "Quantity of Books", with: "-2"
		    	end
		    	it "should not create an order" do
		  		  expect { click_button "Create Order" }.should_not change(Order, :count)
				end
		    end

		    describe "with ETA invalid and quantity valid" do
		    	before do
		    		fill_in "Estimated Time of Arrival", with: "-me+Ci/ow%wef"
		    		fill_in "Quantity of Books", with: "5"
		    	end

		    	it "should not create an order" do
		  		  expect { click_button "Create Order" }.should_not change(Order, :count)
				end
		    end
		  end

		  describe "with valid information" do
		  	before do
		  		fill_in "Estimated Time of Arrival", with: "4/5/2020 3:32 AM"
		  		fill_in "Genre", with: "Science Fiction"
		  		fill_in "Quantity of Books", with: "5"
		  	end

		  	it "should go through successfully" do
		  		expect { click_button "Create Order" }.should change(Order, :count).by(1)
		  	end
		  end
		end
	end
end