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
