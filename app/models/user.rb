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

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :organization
  
  # Custom validations
  validates :name, presence: true
  validates :organization, presence: true, uniqueness: true
  ### TODO: Fix organization validation ###

  # Helper methods
  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

  def total_books
    n = 0
    self.orders.each do |order|
      order.line_items.each do |li|
        n += li.quantity
      end
    end
    return n
  end

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

  def any_orders_completed?
    n = false
    self.orders.each do |order|
      if order.completed?
        n = true
      end
    end
    return n
  end

  def all_orders_completed?
    n = true
    self.orders.each do |order|
      if order.completed == false
        n = false
      end
    end
      return n
  end
end
