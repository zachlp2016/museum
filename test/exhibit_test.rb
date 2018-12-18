require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit.rb'


class ExhibitTest < Minitest::Test

  def setup
    @exhibit = Exhibit.new("Gems and Minerals", 0)
  end

  def test_exhibit_exists
    assert_instance_of Exhibit, @exhibit
  end

  def test_it_has_a_name
    assert_equal "Gems and Minerals", @exhibit.name
  end

  def test_it_has_a_cost
    assert_equal 0, @exhibit.cost
  end



end
