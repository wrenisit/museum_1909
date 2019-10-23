require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'

class PatronTest < MiniTest::Test
  def setup
    @bob = Patron.new("Bob", 20)
  end

  def test_it_exists
    assert_instance_of Patron, @bob
  end

  def test_initialize_data
    assert_equal "Bob", @bob.name
    assert_equal 20, @bob.spending_money
    assert_equal [], @bob.interests
  end

  def test_add_interest
    assert_equal 0, @bob.interests.count
    @bob.add_interest("Dead Sea Scrolls")
    assert_equal 1, @bob.interests.count
    @bob.add_interest("Gems and Minerals")
    assert_equal 2, @bob.interests.count
    assert_equal "Dead Sea Scrolls", @bob.interests.first
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], @bob.interests
  end
end
