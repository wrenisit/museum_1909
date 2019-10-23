require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require './lib/exhibit'
require './lib/patron'

class MuseumTest < MiniTest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    @dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    @imax = Exhibit.new("IMAX", 15)
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_initialize_data
    assert_equal "Denver Museum of Nature and Science", @dmns.name
    assert_equal [], @dmns.exhibits
  end

  
end
