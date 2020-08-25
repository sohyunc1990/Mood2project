

class User < ApplicationRecord
  has_many :trips
  has_many :destinations, through: :trips
  has_many :reviews
  has_many :attractions, through: :reviews

  validates_uniqueness_of :username, message: "has already been taken"

  validates :username, length: {minimum: 2, maximum: 15, message: "must be between 2-15 characters"}

  has_secure_password validations: false

  def all_trips
    Trip.all.select {|trip| trip.user_id == self.id}
  end

  def trip_count
    self.all_trips.count
  end

  def welcome_message
    if self.trip_count > 1
      "Currently, you have #{trip_count} trips planned"
    elsif self.trip_count == 0
      "You have no trips planned"
    elsif self.trip_count == 1
      "Currently, you have 1 trip planned"
    end
  end

  

end
