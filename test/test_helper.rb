require 'rubygems'
require 'test/unit'
require 'sqlite3'
require 'active_record'
require 'shoulda'
require 'factory_girl'

HAS_SLUG_ROOT = File.dirname(__FILE__) + "/.."

ActiveRecord::Base.establish_connection(:adapter  => "sqlite3",
                                        :database => "#{HAS_SLUG_ROOT}/test/test.db")

$:.unshift("#{HAS_SLUG_ROOT}/lib")
require 'has_slug'

require "#{HAS_SLUG_ROOT}/test/schema"
require "#{HAS_SLUG_ROOT}/test/factories"
require "#{HAS_SLUG_ROOT}/test/models"

[City, Restaurant, Kitchen].each { |c| c.reset_column_information }

class Test::Unit::TestCase
  def reset_database!
    City.destroy_all
    Restaurant.destroy_all
    Kitchen.destroy_all
  end
end