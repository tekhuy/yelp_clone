require 'spec_helper'

describe Restaurant, :type => :model do
<<<<<<< HEAD

=======
  
>>>>>>> 9755b9c5c3cb268d8ea41d01baec790fdaee617d
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

<<<<<<< HEAD
end
=======
  it "is not valid unless it has a unique name" do
    Restaurant.create(name: "Moe's Tavern")
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end

end
>>>>>>> 9755b9c5c3cb268d8ea41d01baec790fdaee617d
