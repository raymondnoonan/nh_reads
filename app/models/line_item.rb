# == Schema Information
#
# Table name: line_items
#
#  id         :integer         not null, primary key
#  order_id   :integer
#  quantity   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class LineItem < ActiveRecord::Base
  attr_accessible :quantity
  belongs_to :order

  validates :order_id, presence: true
  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 0, 
    :message => "Invalid quantity"
end
