# == Schema Information
#
# Table name: line_items
#
#  id         :integer         not null, primary key
#  order_id   :integer
#  quantity   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  genre      :string(255)     default("")
#

class LineItem < ActiveRecord::Base
  attr_accessible :quantity, :genre
  belongs_to :order
  
  AdultGenres = %w[adult_fiction romance science_fiction mystery computers law_&_political_science history
  	business math science non-fiction anthropology psychology classics drama poetry parenting biography,_autobiography,_&_memoir
    cookbooks sports hobbies arts teacher_resources reference travel health religion humor foreign
    college_&_career]
  AdultGenresTitled = AdultGenres.map {|t| t.titleize }
  ChildGenres = %w[young_adult_fiction young_adult_series childrens_series children's_poetry 
  	chapter_books picture_books board_books sports science_and_math children's_religion
    holiday social_studies]
  ChildGenresTitled = ChildGenres.map { |x| x.titleize }
  AllGenresTitled = AdultGenresTitled + ChildGenresTitled

  validates_presence_of :genre
  validates_inclusion_of :genre, :in => AllGenresTitled
  validates_presence_of :quantity
  validates_numericality_of :quantity, :only_integer => true, :greater_than => 0
end
