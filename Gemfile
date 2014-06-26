source 'https://rubygems.org'

ruby '2.0.0'

# authentication gem 
gem 'devise'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use Postgres as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Paperclip gem for uploading images:
gem 'paperclip'

# Amazon web services gem required by Paperclip:
gem 'aws-sdk'

# Gem to allow pushing of database data to Heroku: 
gem 'taps'

gem 'bootstrap-sass'

gem 'bootstrap-generators', '~> 3.1.1'

gem 'forgery'

gem 'geocoder' # Produce latitude and longitude from an address. 

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara' # Capybara simulates a user for testing. 
  gem 'factory_girl_rails'
  gem 'pry' # Debugging tool. 
  gem 'dotenv-rails' # For use of .env file. 
end

group :development do
  gem 'spring' ## Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'quiet_assets' # Suppresses messages in the development log.
  gem 'better_errors' # More useful error messages. 
  gem 'binding_of_caller' # Allows grabbing of bindings up the call stack. 
  gem 'awesome_print' # Prints Ruby objects with proper indentation. 
  gem 'pry-rails' # Makes Pry work in the Rails console. 
  gem 'pry-byebug' # Allows stepping through code in Pry, etc. 
end

# rails_12factor equired for Heroku deployment: 
group :production do
  gem 'rails_12factor'
end

