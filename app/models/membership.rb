class Membership
  @@all = []

  attr_accessor :cost, :lifter, :gym

  def initialize(cost, lifter, gym)
    @cost = cost
    @lifter = lifter
    @gym = gym
    @@all << self
  end

  def self.all 
    @@all
  end


end
