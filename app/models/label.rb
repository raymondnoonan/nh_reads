class Label < ActiveRecord::Base
  attr_accessible :note

  belongs_to :order
  has_many :line_items, dependent: :destroy

  scope :order_line_items, lambda { |order| LineItem.where('order_id = ?', order.id) }
end
