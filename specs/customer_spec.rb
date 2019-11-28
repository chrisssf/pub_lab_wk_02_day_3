require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')
require_relative('../food')



class CustomerTest < MiniTest::Test

  def setup()
    @customer = Customer.new("Jim", 10, 25, 55)
    @drink = Drink.new("Whiskey", 2, 5)
    @food = Food.new("Pizza", 5, 2)
  end

  def test_returns_customer_name()
    assert_equal("Jim", @customer.name)
  end

  def test_returns_customer_wallet()
    assert_equal(10, @customer.wallet)
  end

  def test_update_drunkeness_for_customer_name
    assert_equal(60, @customer.update_drunkeness(@drink))
  end

  def test_returns_customer_drink_count()
    assert_equal(0, @customer.drink_count)
  end

  def test_customer_buys_drink()
    @customer.buys_drink(@drink)
    assert_equal(1, @customer.drink_count)
    assert_equal(8, @customer.wallet)
  end

  def test_return_customer_age
    assert_equal(25, @customer.age)
  end

  def test_customer_buys_food()
    @customer.buys_food(@food)
    assert_equal(5, @customer.wallet)
    assert_equal(53, @customer.drunkeness)
  end
end
