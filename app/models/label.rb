##########################################################################################################################
# CLASS: Label
# AUTHOR: Raymond Noonan
# CREATED ON: 7/30/2012
#
# The Label model represents the labels created and to be printed by the book bank manager when finalizing an order.
#
# ATTRIBUTES:
#   1. note (string): a message written by the BBM to be displayed on the label.
#   2. order_id (integer): the foreign key identifying the order the label belongs to
#
##########################################################################################################################

class Label < ActiveRecord::Base
  attr_accessible :note

  belongs_to :order
  has_many :line_items
end
