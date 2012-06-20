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

class Order < ActiveRecord::Base
  attr_accessible :eta
  has_one :line_item, dependent: :destroy
  belongs_to :user
  default_scope order: 'orders.created_at DESC'

  validates :user_id, presence: true
  validates :eta, presence: true
  validates_inclusion_of :completed, :in => [true, false]
end
