class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
      self.artist = artist if artist != nil
      self.genre = genre if genre != nil
  end

  def artist=(artist)
      @artist = artist
      artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
      @genre = genre
      genre.add_song(self) unless genre.songs.include?(self)
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Song.new(name).tap {|new_instance| new_instance.save}
  end

  def new_from_filename(filename)
      song_data = filename.gsub(".mp3","").split(" - ")
      artist = song_data[0]
      song = song_data[1]
      genre = song_data[2]
      Song.new(song, artist, genre)
  end

  def create_from_filename(filename)
    new_from_filename(filename).tap {|file| file.save}
  end

end
