
class Lifter
  @@all = []


  attr_accessor :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end
  def sign_up(cost, gym)
    #Create membership
    Membership.new(cost, self, gym)
  end
  def memberships
    #Access membership => [memberships]
    #Select all memberships for specific member
    Membership.all.select do |m|
      #compare whether or not lifter property == this lifter
      m.lifter == self
    end

  end

  def gyms
    #Access the Memberships.all array
    #Determine whether or not the memberships are mine/lifters
    my_memberships = self.memberships
    #create array of gyms from the memberships array
    my_memberships.map do |m|
      m.gym
    end
  end

  def self.all 
    @@all
  end

  def self.average_lift
    sum = 0
    arr = self.all.each {|i| sum += i.lift_total }
    sum / arr.length
  end

  def total_cost
    sum = 0
    self.memberships.map {|i| sum += i.cost}
    sum
  end

end
