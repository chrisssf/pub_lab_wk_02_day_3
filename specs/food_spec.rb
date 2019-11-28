require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food')

class FoodTest < MiniTest::Test

  def setup()
    @food = Food.new("Pizza", 5, 2)
  end

  def test_returns_food_name
    assert_equal("Pizza", @food.name)
  end

  def test_returns_food_price
    assert_equal(5, @food.price)
  end

  def test_returns_food_rejuvenation_level
    assert_equal(2, @food.rejuvenation_level)
  end

end
