require 'fileutils'
require 'rspec'
require 'headless'
#equire 'rspec-expectations'
require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'
require "active_support/inflector"
require "chronic"
require 'watir-scroll'


# Test development and debugging gems
#require 'pry'
require 'rubocop'

# Require the generic helpers in lib..
Dir[File.dirname(__FILE__) + '/../../lib/*.rb'].each { |f| require f }

World(PageObject)
World(PageObject::PageFactory)
