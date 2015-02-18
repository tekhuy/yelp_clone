class Restaurant < ActiveRecord::Base
<<<<<<< HEAD
  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}
=======

  has_many :reviews, dependent: :destroy

  validates :name, length: {minimum: 3}, uniqueness: true

>>>>>>> 9755b9c5c3cb268d8ea41d01baec790fdaee617d
end
