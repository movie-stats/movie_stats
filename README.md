# MovieStats

This is small gem that could be used to fetch a random list of movies, & varied info about a movie. Refer Usage for further details.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'movie_stats'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install movie_stats

## Usage

	require 'movie_stats'

To get imdb & tomatoes info about a movie, 

	MovieStats::Stats.get_movie_stats('movie_title', 'year_of_release')
	MovieStats::Stats.get_movie_stats('Home', 2015)

For a random list of movies,

	MovieStats::Stats.get_random_movies(number_of_movies_to_return)
	MovieStats::Stats.get_random_movies(10)

For important stats of random list of movies, (Yes, it uses just the above two methods. But I've written it for you xD)
    
    MovieStats::Stats.get_random_movie_stats(number_of_movies)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/movie_stats/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
