class Review < ActiveRecord::Base

  belongs_to :restaurant

<<<<<<< HEAD
=======
  validates :rating, inclusion: (1..5)

>>>>>>> 9755b9c5c3cb268d8ea41d01baec790fdaee617d
end
