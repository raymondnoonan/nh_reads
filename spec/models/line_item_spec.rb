# == Schema Information
#
# Table name: line_items
#
#  id         :integer         not null, primary key
#  order_id   :integer
#  quantity   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  genre      :string(255)     default("")
#

require 'spec_helper'

describe "Line Items" do 
	let(:user) { FactoryGirl.create(:user, organization: "Vanderbilt") }
	let(:order) { FactoryGirl.create(:order, user: user) }
	let(:line_item) { FactoryGirl.create(:line_item, order: order)}

	subject { line_item }

	it { should respond_to(:quantity) }
	it { should respond_to(:label) }
	it { should respond_to(:order_id) }
	it { should respond_to(:label_id) }

	it { should be_valid }

	describe "validations" do
		describe "when quantity is negative" do           # quantity
			before { line_item.quantity = -1 }
			it { should_not be_valid }
		end

		describe "when quantity isn't a number" do
			before { line_item.quantity = "aaaaa" }
			it { should_not be_valid }
		end

		describe "when quantity isn't an integer" do
			before { line_item.quantity = 1.51 }
			it { should_not be_valid }
		end
	end
end
