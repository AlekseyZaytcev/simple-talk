# frozen_string_literal: true

source 'https://rubygems.org'

gem 'dotenv', '~> 2.7', '>= 2.7.6'
gem 'hanami', '~> 1.3', '>= 1.3.3'
gem 'hanami-model', '~> 1.3'
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'rake', '~> 13.0', '>= 13.0.1'

group :development do
  # Code reloading
  # See: https://guides.hanamirb.org/projects/code-reloading
  gem 'hanami-webconsole'
  gem 'shotgun', platforms: :ruby
end

group :test, :development do
  gem 'factory_bot', '~> 6.1'
  gem 'pry-byebug', '~> 3.9'

  # Code quality
  gem 'bundler-audit', '~> 0.7.0.1', require: false
  gem 'fasterer', '~> 0.8.3', require: false
  gem 'overcommit', '~> 0.54.0', require: false
  gem 'reek', '~> 6.0', '>= 6.0.1', require: false
  gem 'rubocop', '~> 0.87.1', require: false
  gem 'rubocop-performance', '~> 1.6', '>= 1.6.1', require: false
  gem 'rubocop-rspec', '~> 1.40', require: false
end

group :test do
  gem 'database_cleaner', '~> 1.8', '>= 1.8.5', require: false
  gem 'json_matchers', '~> 0.11.1', require: false
  gem 'rack-test', '~> 1.1', require: false
  gem 'rspec', '~> 3.9'
  gem 'simplecov', '~> 0.18.5', require: false
  gem 'simplecov-lcov', '~> 0.8.0', require: false
  gem 'undercover', '~> 0.3.4', require: false
end

group :production do
  # gem 'puma'
end
