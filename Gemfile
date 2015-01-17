source 'https://rubygems.org'

# Specify your gem's dependencies in jekyll-textile-converter.gemspec
gemspec

gem "clash", "~> 1.0"

if ENV["JEKYLL_BRANCH"]
  gem "jekyll", github: "jekyll/jekyll", branch: ENV["JEKYLL_BRANCH"]
else
  gem "jekyll", ">= 2.0"
end
