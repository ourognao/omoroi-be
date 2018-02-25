source 'https://rubygems.org'
ruby '2.4.1'

# Ensure https is used in Bundler (workaround for a bug in Bundler to avoid man in the middle attacks)
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Mailcatcher - Catches mail and serves it through a dream (https://github.com/sj26/mailcatcher/)

# Easiest way to add multi-environment yaml settings to Rails, Sinatra, Pandrino and other Ruby projects. (https://github.com/railsconfig/config)
gem 'config'

# Repository for collecting Locale data for Ruby on Rails I18n as well as other interesting, Rails related I18n stuff (https://github.com/svenfuchs/rails-i18n)
gem 'rails-i18n'

# Enumerated attributes with I18n and ActiveRecord/Mongoid support (https://github.com/brainspec/enumerizeZ)
gem 'enumerize'

# Rich debugger for Ruby (https://github.com/deivid-rodriguez/byebug)
gem 'pry-byebug'

# An IRB alternative and runtime developer console (https://github.com/pry/pry)
gem 'pry-rails'

# An IRB alternative and runtime developer console (https://github.com/pry/pry)
gem 'pry'

# Simple Rails app configuration (https://github.com/laserlemon/figaro)
gem "figaro"

# Web application development framework written in the Ruby language. (http://rubyonrails.org/)
gem 'rails', '~> 5.1.1'

# Ruby interface to the PostgreSQL RDBMS (http://www.postgresql.org/)
gem 'pg'

# A ruby web server built for concurrency (https://github.com/puma/puma)
gem 'puma', '~> 3.7'

# Jbuilder: generate JSON objects with a Builder-style DSL (https://github.com/rails/jbuilder)
gem 'jbuilder', '~> 2.5'

# A Ruby client library for Redis (https://github.com/redis/redis-rb)
gem 'redis'

# Rack Middleware for handling (CORS), which makes cross-origin AJAX possible. (https://github.com/cyu/rack-cors)
gem 'rack-cors', require: 'rack/cors'

# Ruby Timezone Library (https://github.com/tzinfo/tzinfo)
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Token based authentication for Rails JSON APIs. Designed to work with jToker and ng-token-auth. (https://github.com/lynndylanhurley/devise_token_auth)
gem 'devise_token_auth'

# OmniAuth is a flexible authentication system utilizing Rack middleware. (https://github.com/omniauth/omniauth)
gem 'omniauth'

group :development do
  # The Listen gem listens to file modifications and notifies you about the changes. (https://github.com/guard/listen)
  gem 'listen', '>= 3.0.5', '< 3.2'
  
  # Preloads your application so things like console, rake and tests run faster (https://github.com/spring-projects/spring-framework)
  gem 'spring'
  
  # Makes Spring watch the filesystem for changes using Listen rather than by polling the filesystem. (https://github.com/jonleighton/spring-watcher-listen)
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :staging, :test do

  # Annotate Rails classes with schema and routes info (https://github.com/ctran/annotate_models)
  gem 'annotate', '~> 2.7.2'

  # Debugging in Ruby (https://github.com/deivid-rodriguez/byebug)
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # A library for generating fake data such as names, addresses, and phone numbers. (https://github.com/stympy/faker)
  gem 'faker'
end
