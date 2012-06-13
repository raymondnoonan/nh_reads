# == Schema Information
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  eta        :datetime
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Order do
  let(:user) { FactoryGirl.create(:user) }
  before do
  	@order = user.orders.build(eta: Time.now)
  end

  subject { @order }

  it { should respond_to(:eta) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @order.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when eta is not present" do
    before { @order.eta = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Order.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
