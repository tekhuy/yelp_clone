require 'rails_helper'

<<<<<<< HEAD
RSpec.describe Review, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
=======
describe Review, :type => :model do
  
  it "is invalid if the rating is more than 5" do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end
  
>>>>>>> 9755b9c5c3cb268d8ea41d01baec790fdaee617d
end
