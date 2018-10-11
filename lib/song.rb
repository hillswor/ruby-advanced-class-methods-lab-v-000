require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
    # instantiates and saves the song, and returns the new song that was created
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
    #instantiates a song with a name property
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
    #instantiates and saves a song with a name property
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
    #can find a song present in @@all by name
    #returns falsey when a song name is not present in @@all
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    #invokes .find_by_name and .create_by_name instead of repeating code
    #returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
    #creates a new Song object with the provided title if one doesn't already exist
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
    #returns all the song instances in alphabetical order by song name
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = (filename.split)
    #initializes a song and artist_name based on the filename format
  end
  binding.pry

  def create_from_filename
    #initializes and saves a song and artist_name based on the filename format
  end

  def destroy_all
    #clears all the song instances from the @@all array
  end

end
