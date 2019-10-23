require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require './lib/exhibit'
require './lib/patron'

class MuseumTest < MiniTest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")

  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_initialize_data
    assert_equal "Denver Museum of Nature and Science", @dmns.name
    assert_equal [], @dmns.exhibits
  end

  def test_add_exhibit
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)

    assert_equal 0, @dmns.exhibits.count
    @dmns.add_exhibit(gems_and_minerals)
    assert_equal 1, @dmns.exhibits.count
    assert_equal [gems_and_minerals], @dmns.exhibits
    @dmns.add_exhibit(dead_sea_scrolls)
    assert_equal 2, @dmns.exhibits.count
    @dmns.add_exhibit(imax)
    assert_equal 3, @dmns.exhibits.count
  end
end
