require "movie_stats/version"
require "mechanize"
require "active_support/core_ext/hash/conversions"
require "json"

module MovieStats
  class Stats
    def self.get_random_movies(quantity = 10)
      movie_titles = Array.new
      random_list = mechanize.get("http://www.randomlists.com/random-movies?qty=#{quantity}")
      movies = random_list.search('ol#result')
      movies_list = Hash.from_xml(movies.to_xml).to_hash['ol']['li']
      if quantity == 1
        movie_titles << movies_list.first[1]['span'][1]
      else
        movies_list.each{|movie| movie_titles << movie["div"]['span'][1]}
      end
      movie_titles
    end

    def self.get_movie_stats(title, year)
      omdb_url = "http://www.omdbapi.com/?t=#{title}&y=#{year}&plot=short&r=json&tomatoes=true"
      omdb_stats = JSON.parse(mechanize.get(omdb_url).body)
      omdb_stats
    end

    def self.get_random_movie_stats(quantity = 10)
      movie_titles = get_random_movies(quantity)
      stats = Array.new
      movie_titles.each do |movie|
        embedded_year = movie.scan(/.*\((\d+)\)$/).first
        year = embedded_year.nil? ? nil : (movie.gsub!(/\ \(#{y = embedded_year.first.to_i}\)/,'') and y)
        imdb_stats = get_movie_stats(movie, year)
        stat = Hash.new
        stat["title"] = movie
        stat["data"] = Hash.new
        stat["data"]["imdb_rating"] = imdb_stats["imdbRating"]
        stat["data"]["imdb_votes"] = imdb_stats["imdbVotes"]
        stat["data"]["critic_score"] = imdb_stats["Metascore"]
        stat["data"]["tomato_rating"] = imdb_stats["tomatoRating"]
        stat["data"]["revenue"] = imdb_stats["BoxOffice"]
        stats << stat
      end
      stats
    end
    private
    def self.mechanize
      @mechanize ||= ::Mechanize.new
    end
  end
end
