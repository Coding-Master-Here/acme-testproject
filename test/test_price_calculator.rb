require 'minitest/autorun'
require_relative '../config/application'

class PriceCalculatorTest < Minitest::Test
  def setup
    @products = PRODUCTS
    @basket = Basket.new(PRODUCTS, DELIVERY_RULES, DISCOUNTS)
  end

  def test_apply_product_discount
    @basket.add('G01')
    subtotal = @products['G01'].price * 2
    options = { product_id: 'G01', required_quantity: 2, discount_rate: 0.5 }
    calculator = PriceCalculator.new(@basket.items, @products, options)
    discounted_total = calculator.apply('ProductDiscount', subtotal)
    expected_total = subtotal - discounted_total
    assert_equal subtotal, expected_total, 'Product discount should apply correctly'
  end

  def test_apply_threshold_discount
    @basket.add('G01')
    @basket.add('R01')
    subtotal = 3295 + 2495
    options = { threshold: 5000, discount_rate: 0.1 }

    calculator = PriceCalculator.new(@basket.items, @products, options)
    discounted_total = calculator.apply('ThresholdDiscount', subtotal)

    expected_discount = subtotal >= options[:threshold] ? subtotal * options[:discount_rate] : 0
    discounted_total_expected = subtotal * 0.1

    assert_equal discounted_total_expected, discounted_total, 'Threshold discount should apply correctly'
  end

  def test_no_discount_applied
    items = ['B01']
    subtotal = 795
    options = {}

    calculator = PriceCalculator.new(items, @products, options)
    discounted_total = calculator.apply('nothing', subtotal)
    expected_total = subtotal - discounted_total

    assert_equal subtotal, expected_total, 'No discount should be applied for low total or unknown discount type'
  end

  def test_product_discount_not_eligible
    items = ['R01']
    subtotal = 3295
    options = { product_id: 'R01', required_quantity: 2, discount_rate: 0.5 }

    calculator = PriceCalculator.new(items, @products, options)
    discounted_total = calculator.apply('ProductDiscount', subtotal)
    expected_total = subtotal - discounted_total

    assert_equal subtotal, expected_total, 'Product discount should not be applied when quantity is insufficient'
  end

  def test_threshold_discount_not_eligible
    items = %w[R01 G01]
    subtotal = 3295 + 2495
    options = { threshold: 6000, discount_rate: 0.1 }

    calculator = PriceCalculator.new(items, @products, options)
    discounted_total = calculator.apply('ThresholdDiscount', subtotal)
    expected_total = subtotal - discounted_total
    assert_equal subtotal, expected_total,
                 'Threshold discount should not be applied when subtotal is below the threshold'
  end
end
