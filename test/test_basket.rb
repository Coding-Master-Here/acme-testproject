require 'minitest/autorun'
require_relative '../config/application'

class BasketTest < Minitest::Test
  def setup
    @basket1 = Basket.new(PRODUCTS, DELIVERY_RULES, DISCOUNTS)
    @basket2 = Basket.new(PRODUCTS, DELIVERY_RULES, DISCOUNTS)
    @basket3 = Basket.new(PRODUCTS, DELIVERY_RULES, DISCOUNTS)
    @basket4 = Basket.new(PRODUCTS, DELIVERY_RULES, DISCOUNTS)
  end

  def test_basket1_total
    @basket1.add('B01')
    @basket1.add('G01')
    assert_equal 37.85, @basket1.total
  end

  def test_basket2_total
    @basket2.add('R01')
    @basket2.add('R01')
    assert_equal 47.785, @basket2.total
  end

  def test_basket3_total
    @basket3.add('R01')
    @basket3.add('G01')
    assert_equal 55.06, @basket3.total
  end

  def test_basket4_total
    @basket4.add('B01')
    @basket4.add('B01')
    @basket4.add('R01')
    @basket4.add('R01')
    @basket4.add('R01')
    assert_equal 89.75, @basket4.total
  end
end
