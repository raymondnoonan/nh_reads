require 'spec_helper'

describe Label do
  let(:user)  { FactoryGirl.create(:user) }
  let(:order) { FactoryGirl.create(:order, user: user) }
  let(:label) { FactoryGirl.create(:label, order: order) }
  let(:line_item_1) { FactoryGirl.create(:line_item, label: label)}
  let(:line_item_2) { FactoryGirl.create(:line_item, label: label)}
  subject { label }

  describe "attributes and associations" do
  	it { should respond_to(:note) }         # attributes
  	it { should respond_to(:order_id) }

  	it { should respond_to(:order) }        # associations
  	it { should respond_to(:line_items) }
    its(:order) { should == order }
  end

  describe "accessible attributes" do
    it "should not allow access to order_id" do
      expect do
        Label.new(order_id: order.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
