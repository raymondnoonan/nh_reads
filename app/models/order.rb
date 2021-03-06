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
  attr_accessible :eta, :chronic_eta, :line_items_attributes, :destination, :completed, :solicitor
  scope :this_month, lambda { where("eta > ? AND eta < ?", Time.now.beginning_of_month, Time.now.end_of_month) }

  belongs_to :user
  has_many :line_items, dependent: :destroy
  
  accepts_nested_attributes_for :line_items

  validates :user_id, presence: true
  validates_date :eta, :on_or_after => Time.now
  validates :chronic_eta, presence: true
  validates_inclusion_of :completed, :in => [true, false]
  validates :destination, presence: true

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

  def user_organization
    self.user.organization
  end
end
