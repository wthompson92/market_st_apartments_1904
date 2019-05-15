require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'
require './lib/building'

class BuildingTest < Minitest::Test
  def setup
    @building = Building.new
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @jessie = Renter.new("Jessie")
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @spencer = Renter.new("Spencer")
  end

  def test_it_exists
    expected = Building
    actual = @building
    assert_instance_of expected, actual
  end

  def test_it_can_add_units
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    expected = [@a1, @b2]
    actual = @building.units
    assert_equal expected, actual
  end

  def test_it_averages_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    expected = 1099.5
    actual = @building.average_rent.to_f
    assert_equal expected, actual
  end

  def test_it_can_find_renter_with_highest_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    @b2.add_renter(@spencer)
      expected = @spencer
      actual = @building.renter_with_highest_rent
      assert_equal expected, actual
    @a1.add_renter(@jessie)
      expected = @jessie
      actual = @building.renter_with_highest_rent
      assert_equal expected, actual
  end

  def test_annual_breakdown
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    @b2.add_renter(@spencer)
      expected = {"Spencer" => 11988}
      actual = @building.annual_breakdown
      assert_equal expected, actual
    @a1.add_renter(@jessie)
      expected = {"Jessie" => 14400, "Spencer" => 11988}
      actual = @building.annual_breakdown
      assert_equal expected, actual
  end
end
