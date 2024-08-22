require_relative 'config/application'

basket1 = Basket.new(PRODUCTS, DELIVERY_RULES, DISCOUNTS)
basket1.add('B01')
basket1.add('G01')
puts basket1.total # => 37.85

basket2 = Basket.new(PRODUCTS, DELIVERY_RULES, DISCOUNTS)
basket2.add('R01')
basket2.add('R01')
puts basket2.total # => 54.37

basket3 = Basket.new(PRODUCTS, DELIVERY_RULES, DISCOUNTS)
basket3.add('R01')
basket3.add('G01')
puts basket3.total # => 60.85

basket4 = Basket.new(PRODUCTS, DELIVERY_RULES, DISCOUNTS)
basket4.add('B01')
basket4.add('B01')
basket4.add('R01')
basket4.add('R01')
basket4.add('R01')
puts basket4.total # => 98.27
