require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum.rb'
require './lib/patron.rb'
require './lib/exhibit.rb'
require 'pry'


class MuseumTest < Minitest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    @dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    @imax = Exhibit.new("IMAX", 15)
    @bob = Patron.new("Bob", 20)
    @sally = Patron.new("Sally", 20)
  end

  def test_museum_exists
    assert_instance_of Museum, @dmns
  end

  def test_museum_has_name
    assert_equal "Denver Museum of Nature and Science", @dmns.name
  end

  def test_it_holds_exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  def test_it_recommends_exhibits
    @bob.add_interest(@dead_sea_scrolls)
    @bob.add_interest(@gems_and_minerals)
    @sally.add_interest(@imax)
    assert_equal [@dead_sea_scrolls, @gems_and_minerals], @dmns.recommend_exhibits(@bob)
    assert_equal [@imax], @dmns.recommend_exhibits(@sally)

  end

  def test_patrons_can_be_admitted
    @bob.add_interest(@dead_sea_scrolls)
    @bob.add_interest(@gems_and_minerals)
    @sally.add_interest(@dead_sea_scrolls)
    @dmns.admit(@bob)
    @dmns.admit(@sally)
    assert_equal [@bob, @sally], @dmns.patrons
  end

  def test_it_can_hold_patrons_by_exhibit_interest
    @bob.add_interest(@dead_sea_scrolls)
    @bob.add_interest(@gems_and_minerals)
    @sally.add_interest(@dead_sea_scrolls)
    @dmns.admit(@bob)
    @dmns.admit(@sally)
    assert_equal @dead_sea_scrolls, @dmns.patrons_by_exhibit_interest
  end
end
