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

class Viewer
  attr_accessor :first_name, :last_name


  @@all = []

  def initialize(first_name, last_name)
    # @name = name
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(full_name)
    self.all.detect do |viewer|
      viewer.full_name == full_name
    end
  end

  def create_rating(viewer, movie, ratings)
    rating = Rating.new(movie, ratings)
    rating.viewer = self
  end

end

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

