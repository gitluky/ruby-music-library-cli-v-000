class MusicLibraryController

  def initialize(path="./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = nil
    while input != 'exit'

      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets

      case input
      when "list songs"
        Song.all
      when "list artists"
        Artist.all
      when "list genres"
        Genre.all
      when "list artist"
        puts "Which artist?"
        artist = gets
        Artist.find_by_name(artist.songs {|song| puts song.name}
      when "list genre"
        puts "Which genre?"
        genre = gets
        Genre.find_by_name(genre).songs {|song| puts song.name}
      when "play song"
        puts "song playing"
      else
        puts "Please choose from the list above"
      end
    end
  end

end

music_library_controller = MusicLibraryController.new
music_library_controller.call
