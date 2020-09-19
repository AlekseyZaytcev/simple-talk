# frozen_string_literal: true

source 'https://rubygems.org'

gem 'hanami', '~> 1.3'
gem 'hanami-model', '~> 1.3'
gem 'dry-auto_inject'
gem 'pg'
gem 'rake'

group :development do
  # Code reloading
  # See: https://guides.hanamirb.org/projects/code-reloading
  gem 'hanami-webconsole'
  gem 'shotgun', platforms: :ruby
end

group :test, :development do
  gem 'byebug'
  gem 'dotenv'
  gem 'factory_bot'
  gem 'faker'

  # Code quality
  gem 'bundler-audit', require: false
  gem 'fasterer', require: false
  gem 'lefthook', require: false
  gem 'reek', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'json_matchers'
  gem 'rack-test'
  gem 'rspec'
  gem 'simplecov'
  gem 'simplecov-lcov'
  gem 'undercover'
end

group :production do
  # gem 'puma'
end
