# == Schema Information
#
# Table name: organizations
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  address_street :string(255)
#  address_town   :string(255)
#  address_state  :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

require 'spec_helper'

describe "Organization" do 
    let(:organization) { FactoryGirl.create(:organization) }
	let(:user) { FactoryGirl.create(:user, organization: organization) }
	let(:order) { FactoryGirl.create(:order, user: user) }

	subject { organization }

	it { should respond_to(:users) }
	it { should respond_to(:address_street) }
	it { should respond_to(:address_state) }
	it { should respond_to(:address_town) }

	it { should be_valid }

	describe "validations" do
		describe "when street is not present" do
			before { organization.address_street = nil }
			it { should_not be_valid }
		end

		describe "when town is not present" do
			before { organization.address_town = nil }
			it { should_not be_valid }
		end

		describe "when state is not present" do
			before { organization.address_state = nil }
			it { should_not be_valid }
		end
	end
end
