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
#  organization_id        :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders, dependent: :destroy

  before_save do |user| 
    user.email = email.downcase
    user.organization = organization.downcase
  end

  ######################## Setup accessible (or protected) attributes for the model ###################################

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :organization, :name
  
  ######################################### Custom Validations #########################################################

  validates :name, presence: true
  validates :organization, presence: true, uniqueness: { case_sensitive: false }

  ########################################## Helper methods ############################################################

  def self.months_with_book_orders
    a = []
    orders = Order.joins(:line_items).where("quantity > 0").order("eta DESC")
    orders.each do |order|
      eta = order.eta.strftime("%b %Y")
      a.append(eta)
    end
    return a.uniq
  end

  # DESCRIPTION: Returns a hash whose keys are all of the genres in alphabetical order and whose values are the total books
  # ordered by all users of each genre for the current month.

  def self.books_for_month(time)
    a = Hash.new(0) # default value is zero
    line_items = LineItem.joins(:order).where("eta > ? AND eta < ?", time.beginning_of_month, time.end_of_month).order("genre ASC")
    line_items.each do |li|
      a["#{li.genre}"] += li.quantity
    end
    return a
  end

  # DESCRIPTION: Returns an integer that is the total number of books ordered this month.
  def self.total_books_for_month(time)
    a = 0
    books_for_month(time).each_value do |genre_quantity|
      a += genre_quantity
    end
    return a
  end

  def first_name
    self.name.split.first if name
  end

  def last_name
    self.name.split.last if name
  end

  # DESCRIPTION: Returns the total number of books ordered by the given user.
  def total_books
    n = 0
    self.orders.each do |order|
      order.line_items.each do |li|
        n += li.quantity
      end
    end
    return n
  end

  # DESCRIPTION: Returns the total number of books of the specific genre ordered by the given user.
  def number_of(desired_genre)
    n = 0
    self.orders.each do |order|
      order.line_items.each do |li|
        if li.genre == desired_genre 
          n += li.quantity
        end
      end
    end
    return n
  end
end