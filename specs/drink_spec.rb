require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class DrinkTest < MiniTest::Test

  def setup
    @drink = Drink.new("Whiskey", 2, 5)
  end

  def test_return_drink_name()
    assert_equal("Whiskey", @drink.name)
  end

  def test_return_drink_price()
    assert_equal(2, @drink.price)
  end

end
