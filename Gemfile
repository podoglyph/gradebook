source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bcrypt', '~> 3.1.7'
gem 'kaminari', '~> 1.1.1 '
gem 'faker', '~> 1.8.7'
gem 'jquery-rails', '~> 4.3.1'
gem 'bootstrap', '~> 4.0.0'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'rspec-rails', '~> 3.7.2'
  gem 'capybara', '~> 2.18.0'
  gem 'launchy', '~> 2.4.3'
  gem 'shoulda-matchers', '~> 3.1.2'
  gem 'factory_bot_rails', '~> 4.8.2'
  gem 'pry-state', '~> 0.1.10'
end
