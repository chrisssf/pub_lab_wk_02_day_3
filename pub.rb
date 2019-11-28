class Pub


  attr_reader(:name, :till)

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def increase_till_amount(item)
    @till += item.price
  end

  def verify_age(customer)
    return true if customer.age >= 18
    return false if customer.age <= 17
  end

  def is_customer_too_drunk(customer)
    return true if customer.drunkeness >= 50
    return false if customer.drunkeness < 50
  end

  def can_customer_afford_drink(customer, drink)
    customer.wallet >= drink.price ? true : false
  end


  def sell_drink_to_customer(customer, drink)
    response = ""
    if verify_age(customer) == false
      response << "Not old enought to buy a drink! "
    end
    if can_customer_afford_drink(customer, drink) == false
      response << "You can't afford this drink! "
    end
    if is_customer_too_drunk(customer) == true
      response << "Sorry mate, you,ve had enough!"
    end
    if response == ""
      increase_till_amount(drink)
      customer.buys_drink(drink)
      customer.update_drunkeness(drink)
      return "Thanks, here is your drink!"
    else
      return response
    end

  end

  # def calculate_total_stock_value(drink,drink1,drink2)
  #   return (@drinks[:whiskey] * drink.price) + (@drinks[:beer] * drink1.price) + (@drinks[:gin_and_tonic] * drink2.price)
  # end
  def calculate_total_stock_value(drinks)
    total = 0
    drinks.each do | drink_name, info |
      total += info[:stock] * info[:price]
    end
    return total
  end
end
