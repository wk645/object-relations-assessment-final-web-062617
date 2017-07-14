class Rating
  attr_accessor :viewer, :movie, :ratings

  @@all = []

  def initialize(viewer, movie, ratings)
  	@viewer = viewer
  	@movie = movie
  	@ratings = ratings
  	@@all << self
  end

  def self.all
  	@@all
  end
  
end
