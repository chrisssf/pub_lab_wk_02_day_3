class Customer

  attr_reader(:name, :wallet, :age, :drunkeness)

  def initialize(name, wallet, age, drunkeness = 0)
    @name = name
    @wallet = wallet
    @age = age
    @drunkeness = drunkeness
    @drinks_drank = []
  end

  def drink_count()
    @drinks_drank.length()
  end

  def buys_drink(drink)
    @drinks_drank.push(drink.name)
    @wallet -= drink.price
  end

  def update_drunkeness(drink)
    @drunkeness += drink.alchohol_level
  end

  def buys_food(food)
    @wallet -= food.price
    @drunkeness -= food.rejuvenation_level
  end
end
