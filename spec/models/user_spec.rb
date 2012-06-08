# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe User do
  before  { @user = User.new(name: "Example User", email: "user@example.com") }
  subject { @user }

  # Attributes of User model
  it { should respond_to(:name) }
  it { should respond_to(:email) }

  # Ensures that attributes of User model are properly validated
  describe "validations" do

  		describe "when name is not present" do       # Validations for name attribute
  			before { @user.name = " " }
  			it { should_not be_valid }
  		end

  		describe "when name is too long" do
  			before { @user.name = "a" * 61 }
  			it { should_not be_valid }
  		end

	  	describe "when email is not present" do      # Validations for email attribute
 	 		before { @user.email = " "}
 	 		it { should_not be_valid }
		end

		describe "when email is not valid" do
			it "should not be valid" do
				addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.org foo@bar+baz.org]
				addresses.each do |bad_address|
					@user.email = bad_address
					@user.should_not be_valid
				end
			end
		end

		describe "when email is valid" do
			it "should be valid" do
				addresses = %w[user@foo.COM A_US-ER@f.b.org frt.lst@foo.jp a+b@baz.cn]
				addresses.each do |good_address|
					@user.email = good_address
					@user.should be_valid
				end
			end
		end

		describe "when email is not unique" do
			before do
				@second_user = @user.dup
				@second_user.email = @user.email.upcase
				@second_user.save
			end

			it { should_not be_valid }
		end
	end
end
