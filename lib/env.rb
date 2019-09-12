require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative "./wine_bar/version"
require_relative "./wine_bar/cli.rb"
require_relative "./wine_bar/scrape.rb"
require_relative "./wine_bar/bottle.rb"
require_relative "./wine_bar/page.rb"
require_relative "./wine_bar/errors.rb"
#=> file giving all other files "directions" on where to look for other needed files