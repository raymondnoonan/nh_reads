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

class Organization < ActiveRecord::Base
  attr_accessible :address_state, :address_street, :address_town, :name
  has_many :users, dependent: :destroy
end
