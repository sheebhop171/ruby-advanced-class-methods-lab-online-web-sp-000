require 'pry'

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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
   @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)

  #  self.find_by_name(name) || self.create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)

    mp3 = filename.split(" - ")
    artist_name = mp3[0]
    mp3_name = mp3[1]
    name = mp3_name.split(".mp3").join

    new_song = self.new
    new_song.name = name
    new_song.artist_name = artist_name

    new_song

  end

  def self.create_from_filename(filename)

    mp3 = filename.split(" - ")
    artist_name = mp3[0]
    mp3_name = mp3[1]
    name = mp3_name.split(".mp3").join

    new_song = self.create
    new_song.name = name
    new_song.artist_name = artist_name

    new_song

  end

  def self.destroy_all
    @@all.clear
  end

end
