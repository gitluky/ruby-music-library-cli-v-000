require 'pry'
class MusicImporter

  attr_accessor :files
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob('#{path}/*.mp3').collect {|song| song.gsub('#{path}/','')}
  end

  def import
    files.each do |filename|
      song_data = filename.gsub('.mp3','').split(' - ')
      artist = song_data[0]
      song = song_data[1]
      genre = song_data[2]
      Song.new(song, artist, genre)
    end
  end

end

new_import = MusicImporter.new('./db/mp3s')
binding.pry
