require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'

class ApartmentTest < Minitest::Test
  def setup
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @jessie = Renter.new("Jessie")
  end

  def test_it_exists
    expected = Apartment
    actual = @a1
    assert_instance_of expected, actual
  end

  def test_it_has_a_number
    expected = "A1"
    actual = @a1.number
    assert_equal expected, actual
  end

  def test_it_has_monthly_rent
    expected = 1200
    actual = @a1.monthly_rent
    assert_equal expected, actual
  end

  def test_it_has_bathrooms
    expected = 1
    actual = @a1.bathrooms
    assert_equal expected, actual
  end

  def test_it_has_bedrooms
    expected = 1
    actual = @a1.bedrooms
    assert_equal expected, actual
  end

  def test_if_apartment_has_renter
    actual = @a1.renter
    assert_nil actual
  end

  def test_it_can_add_a_renter
    @a1.add_renter(@jessie)
    expected = @jessie
    actual = @a1.renter
    assert_equal expected, actual
  end
end
