# == Schema Information
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  eta        :datetime
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  completed  :boolean         default(FALSE)
#

# == Schema Information
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  eta        :datetime
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  completed  :boolean         default(FALSE)
#
require 'chronic'

class Order < ActiveRecord::Base
  attr_accessible :eta, :chronic_eta
  has_many :line_items, dependent: :destroy
  belongs_to :user
  default_scope order: 'orders.created_at DESC'

  validates :user_id, presence: true
  validates :eta, presence: true
  validates_inclusion_of :completed, :in => [true, false]

  def chronic_eta
  	self.eta
  end

  def chronic_eta=(s)
  	self.eta = Chronic.parse(s) if s
  end
end
