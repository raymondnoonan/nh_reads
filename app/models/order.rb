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
  attr_accessible :eta, :chronic_eta, :line_items_attributes, :destination, :completed
  scope :this_month, lambda { where("eta > ? AND eta < ?", Time.now.beginning_of_month, Time.now.end_of_month) }

  belongs_to :user
  has_many :line_items, dependent: :destroy
  accepts_nested_attributes_for :line_items

  default_scope order: 'orders.created_at DESC'

  validates :user_id, presence: true
  validates_date :eta, :on_or_after => Time.now
  validates :chronic_eta, presence: true
  validates_inclusion_of :completed, :in => [true, false]
  validates :destination, presence: true

  def self.as_data(orders)
    orders.map do |item|
      [ 
        item.organization.titleize, 
        item.destination, 
        item.total_books, 
        item.eta.strftime("%b %e, %Y"), 
        item.created_at.strftime("%b %e, %Y") 
      ]
    end
  end

  def chronic_eta
  	self.eta
  end

  def completed?
    self.completed
  end

  def chronic_eta=(s)
  	self.eta = Chronic.parse(s) if s
  end

  def total_books
    n = 0
    self.line_items.each do |li|
      n += li.quantity
    end
    return n
  end

  def organization
    self.user.organization
  end
end
