require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'

class RenterTest < Minitest::Test
  def setup
    @jessie = Renter.new("Jessie")
  end

  def test_it_exists
    expected = Renter
    actual = @jessie
    assert_instance_of expected, actual
  end

  def test_renter_has_name
    expected = "Jessie"
    actual = @jessie.name
    assert_equal expected, actual
  end
end
