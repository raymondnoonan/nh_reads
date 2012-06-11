# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  name                   :string(255)
#

require 'spec_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user) }
  subject { user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  # Validations
    describe "validations" do
  	    describe "when name is blank" do  # Name
  		  before { user.name = " " }    # Must do custom validations because not a part of devise
  		  it { should_not be_valid }
   	    end

  	    describe "when name is too long" do
  		  before { user.name = "a" * 51 }
  		  it { should_not be_valid }
  	    end

   	    describe "when email is blank" do # Email
  		  before { user.email = " " }
  		  it { should_not be_valid }
  	    end

#  	    describe "when email format is invalid" do
#  		  addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
#  		  addresses.each do |bad_address|
#  			  user.email = bad_address
#  			  user.should_not be_valid
#  		    end
#  	    end

#  	    describe "when email format is valid" do
#  		    describe "it should be valid" do
#  			    addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
#  			    addresses.each do |good_address|
#  				  user.email = good_address
#  				  user.should be_valid
#  			    end
#  		    end
#  	    end
    end
end
