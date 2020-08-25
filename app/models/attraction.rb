

class Attraction < ApplicationRecord
  belongs_to :destination
  has_many :reviews
  has_many :users, through: :reviews

  def total_reviews
    self.reviews.count
  end

  def ratings
    self.reviews.map {|review| review.rating.to_f }
  end

  def average_rating
    if self.ratings.length == 0
      "No reviews yet"
    elsif self.ratings.length > 0
      rating = self.ratings.sum/self.ratings.length
      "Average #{rating.round(1)}/5 Stars"
    end
  end

  def self.highest_rated_attraction
    top = self.all.first
    self.all.each do |attr|
      if attr.average_rating > top.average_rating
        top = attr
      end
    end
    top
  end

  def self.highest_rated_attraction_name
    self.highest_rated_attraction.name
  end

  def self.sort_alphabetically
    self.all.order(:name)
  end

end
