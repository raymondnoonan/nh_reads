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

class Order < ActiveRecord::Base
  attr_accessible :eta
  belongs_to :user
  default_scope order: 'orders.created_at DESC'

  validates :user_id, presence: true
  validates :eta, presence: true
end
