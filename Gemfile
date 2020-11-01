# frozen_string_literal: true

source "https://rubygems.org/"

# app
gem "dry-system"
gem "dry-types"
gem "dry-monitor"
gem "warning"

# persistence
gem "sqlite3"
gem "rom"
gem "rom-sql"

# web
gem "puma"
gem "hanami-api", "~> 0.1"
gem "rake"

group :benchmarks do
  gem "hotch"
end

# test + development
group :development, :test do
  gem "oj"
  gem "pry-byebug"
  gem "rubocop", "~> 1.0"
end

group :test do
  gem "rom-factory"
  gem "rspec"
  gem "rack-test"
  gem "capybara"
  gem "capybara-screenshot"
  gem "cuprite"
  gem "puffing-billy"
  gem "simplecov"
end
