class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @ratings = []
    @@all << self
  end

  def self.all
  	@@all
  end

  def ratings
  	Rating.all.select do |rating|
  		rating.movie == self
  	end
  end

  def viewers
  	self.ratings.collect do |rating|
  		rating.viewer
  	end
  end

 
  def average_rating
  	score = self.ratings.map {|rating| rating.score}
  	score.inject {|sum, el| sum + el }.to_f / score.size
  end

      # .inject(0.0) {|sum, el| sum + el} / rating.score.size

  
end


# movie has_many viewers through ratings
# artist has_many comments through posts
# restaurant has_many reviews through customers