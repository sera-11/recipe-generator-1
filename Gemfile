source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

gem 'sinatra', '2.2.4'  # Updated to a version compatible with rack-protection 2.2.4
gem 'sinatra-contrib', '2.2.4'
gem 'mustermann', '~> 2.0'
gem 'rack-protection', '2.2.4'


# Use Puma as the app server
gem "puma", "~> 5.0"

# Use active record
gem "sinatra-activerecord"

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "table_print"
  gem "appdev_support"
end

group :development, :test do
  gem "grade_runner"
  gem "pry"
  gem "sqlite3", "~> 1.4"
end

group :test do
  gem "capybara"
  gem "draft_matchers"
  gem "rspec"
  gem "rspec-html-matchers"
  gem "webmock"
  gem "webdrivers"
  gem "i18n"
end

gem "http"
