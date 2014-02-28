require 'rubygems' unless defined? ::Gem
require 'bundler'
Bundler.setup
require File.dirname(__FILE__) + '/app'

run Sinatra::Application
