# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'movie_stats/version'

Gem::Specification.new do |spec|
  spec.name          = "movie_stats"
  spec.version       = MovieStats::VERSION
  spec.authors       = ["venkatramanka"]
  spec.email         = ["movie.stats.gem@gmail.com"]

  spec.summary       = %q{Gem to fetch movie stats}
  spec.description   = %q{This gem fetches movie stats using omdbapi & random list of movies from randomlists}
  spec.homepage      = "http://github.com/movie-stats/movie_stats"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'mechanize', '~> 2.6', '>= 2.6.0'
  spec.add_runtime_dependency 'rails', '>= 3.2.0', '< 5'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
