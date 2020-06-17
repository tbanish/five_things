require "five_things/version"
require_relative 'five_things/cli'
require_relative 'five_things/article'
require_relative 'five_things/scraper'
require 'pry'
require 'nokogiri'
require 'open-uri'

module FiveThings
  class Error < StandardError; end
  # Your code goes here...
end
