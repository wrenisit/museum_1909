require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'
require './lib/exhibit'
require './lib/patron'

class MuseumTest < MiniTest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @bob = Patron.new("Bob", 20)
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Gems and Minerals")
    @sally = Patron.new("Sally", 20)
    @sally.add_interest("IMAX")
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

  def test_recommend_exhibits
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    @dmns.add_exhibit(gems_and_minerals)
    @dmns.add_exhibit(dead_sea_scrolls)
    @dmns.add_exhibit(imax)

    assert_equal 2, @dmns.recommend_exhibits(@bob).count
    assert_equal 1, @dmns.recommend_exhibits(@sally).count
  end

  def test_admit_method_and_patrons_array
    assert_equal [], @dmns.patrons
    @dmns.admit(@bob)
    assert_equal [@bob], @dmns.patrons
    @dmns.admit(@sally)
    assert_equal [@bob, @sally], @dmns.patrons
  end

  def test_patrons_by_exhibit_interest
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    @dmns.add_exhibit(gems_and_minerals)
    @dmns.add_exhibit(dead_sea_scrolls)
    @dmns.add_exhibit(imax)
    @dmns.admit(@bob)
    @sal = Patron.new("Sal", 20)
    @dmns.admit(@sal)
    @sal.add_interest("Dead Sea Scrolls")
    assert_equal 3, @dmns.patrons_by_exhibit.flatten.count
    assert_equal true, @dmns.patrons_by_exhibit.include?(imax)
    assert_equal true, @dmns.patrons_by_exhibit.include?(dead_sea_scrolls)
    assert_equal true, @dmns.patrons_by_exhibit.include?(gems_and_minerals)
  end
  
end
