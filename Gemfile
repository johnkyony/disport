source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.4.1'
gem 'rails', '~> 5.1.1'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'omniauth-facebook'
gem 'koala'
gem "erb2haml", :group => :development
gem "webpacker"
gem 'geocoder'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end
gem 'simplecov', :require => false, :group => :test
gem 'annotate'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'haml-rails'
gem 'high_voltage'
gem 'pg'
gem 'therubyracer', :platform=>:ruby
group :development do
  gem 'better_errors'
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'rails_layout'
end
group :development, :test do
  gem 'rubocop'
end
group :test do
  gem "connection_pool"
  gem "launchy"
  gem "minitest-reporters"
  gem "mocha"
  gem "poltergeist"
  gem "capybara-webkit"
  gem "shoulda-context"
  gem "shoulda-matchers", ">= 3.0.1"
 
end

group :test do
  gem 'minitest-rails'
  gem 'minitest-rails-capybara'
  gem 'minitest-focus'
  gem "chromedriver-helper"
end

group :development do
  
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem "rack-livereload"
  gem "better_errors"
  gem 'annotate'
  gem "guard-minitest", :require => false
  gem "rb-fsevent", :require => false
  gem "terminal-notifier-guard", :require => false

end