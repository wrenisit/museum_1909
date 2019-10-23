require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'

class ExhibitTest < MiniTest::Test

  def setup
    @exhibit = Exhibit.new("Gems and Minerals", 0)
  end

  def test_it_exists
    assert_instance_of Exhibit, @exhibit
  end

end
