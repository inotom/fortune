require 'rubygems' unless defined? ::Gem
require 'sinatra'
require 'slim'
require 'yaml'
require File.dirname(__FILE__) + '/app/fortune'

configure do
  set :views, File.dirname(__FILE__) + '/views'
end

before do
  lots_file = File.dirname(__FILE__) + '/config/lots.yml'
  lots = YAML.load(File.read(lots_file))

  fortune = Fortune.new lots
  @lucky  = fortune.draw
  @total  = fortune.draw "total"
  @money  = fortune.draw "money"
  @health = fortune.draw "health"
  @love   = fortune.draw "love"
end

get '/' do
  slim :"index.html"
end
