class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self

  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    Owner.all.clear
  end

  def cats
    Cat.all.find_all { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.find_all { |dog| dog.owner == self }
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
    # self here refers to the Owner instance that it's being called on
  end
  
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
      Dog.all.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.map {|cat| cat.mood = "happy"}
  end

def sell_pets
  Cat.all.map {|cat| cat.mood = "nervous" }
  Cat.all.map {|cat| cat.owner = nil}
  Dog.all.map {|dog| dog.mood = "nervous"}
  Dog.all.map {|dog| dog.owner = nil}
end

def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end

end