class Cat
  # code goes here

  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize( name, owner )
    @@all << self
    @name = name
    @owner = owner
    @mood = "nervous"
  end

  def self.all
    @@all
  end
end