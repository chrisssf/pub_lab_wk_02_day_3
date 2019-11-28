require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drink')
require_relative('../customer')
require_relative('../food')


class PubTest < MiniTest::Test

  def setup()
    @stock = {beer: {stock: 10, price: 3} , whiskey: {stock: 15, price: 2}, gin_and_tonic: {stock: 20, price: 4}}
    @pub = Pub.new("The Typing Wrists", 50, @stock)
    @drink = Drink.new("Whiskey", 2, 5)
    @drink1 = Drink.new("Beer", 3, 3)
    @drink2 = Drink.new("Gin and Tonic", 4, 4)
    @customer1 = Customer.new("Jim", 10, 25, 55)
    @customer2 = Customer.new("Dave", 20, 17, 10)
    @customer3 = Customer.new("Bob", 30, 23, 5)
    @customer4 = Customer.new("Steve", 1, 17, 60)
    @food = Food.new("Pizza", 5, 2)

  end

  def test_returns_pub_name()
    assert_equal("The Typing Wrists", @pub.name)
  end

  def test_returns_pub_till_amount()
    assert_equal(50, @pub.till)
  end

  def test_pub_till_amount_can_be_increased__for_drink()
    @pub.increase_till_amount(@drink)
    assert_equal(52, @pub.till)
  end

  def test_pub_till_amount_can_be_increased__for_food()
    @pub.increase_till_amount(@food)
    assert_equal(55, @pub.till)
  end

  def test_to_verify_customer_age_is_above_18
    assert_equal(true, @pub.verify_age(@customer1))
    assert_equal(false, @pub.verify_age(@customer2))
  end

  def test_pub_refuses_sale_if_drunkeness_too_high
    assert_equal(true, @pub.is_customer_too_drunk(@customer1))
  end

  def test_can_customer_afford_drink
    assert_equal(true, @pub.can_customer_afford_drink(@customer1, @drink))
    assert_equal(false, @pub.can_customer_afford_drink(@customer4, @drink))
  end

  def test_pub_sell_drink_to_customer
    assert_equal("Thanks, here is your drink!", @pub.sell_drink_to_customer(@customer3, @drink))
    assert_equal(52, @pub.till)
    assert_equal(28, @customer3.wallet)
    assert_equal(10, @customer3.drunkeness)

    assert_equal("Not old enought to buy a drink! You can't afford this drink! Sorry mate, you,ve had enough!", @pub.sell_drink_to_customer(@customer4, @drink))
    assert_equal("Not old enought to buy a drink! ", @pub.sell_drink_to_customer(@customer2, @drink))
  end

  def test_stock_value_returns_total
    # assert_equal(140, @pub.calculate_total_stock_value(@drink,@drink1,@drink2))
    assert_equal(140, @pub.calculate_total_stock_value(@stock))
  end

end
