class Drink

  attr_reader(:name, :price, :alchohol_level)

  def initialize(name, price, alchohol_level)
    @name = name
    @price = price
    @alchohol_level = alchohol_level
  end
end
