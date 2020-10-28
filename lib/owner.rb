require 'pry'

class Owner
  # code goes here
  
  attr_reader :name

  @@all = []

  def initialize( name )
    @name = name
    @@all << self
    species
  end

  def species
    @species = "human"
  end

  def say_species
    "I am a #{ @species }."
  end

  def self.all
    @@all
  end
  
  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    mycats = []
    Cat.all.each do |cat|
      if cat.owner == self
        mycats << cat
      end
    end
    mycats
  end

  def dogs
    mydogs = []
    Dog.all.each do |dog|
      if dog.owner == self
        mydogs << dog
      end
    end
    mydogs
  end

  def buy_cat( name )
    Cat.new( name, self )
  end

  def buy_dog( name )
    Dog.new( name, self )
  end

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    Dog.all.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end

    Cat.all.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    mycats = cats.length
    mydogs = dogs.length
    "I have #{ mydogs } dog(s), and #{ mycats } cat(s)."
  end
end