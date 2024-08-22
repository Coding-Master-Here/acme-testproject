class Basket
  attr_reader :products, :delivery_charges, :discounts, :items

  def initialize(products, delivery_charges, discounts)
    @products = products
    @delivery_charges = delivery_charges
    @discounts = discounts
    @items = []
  end

  def add(product_code)
    @items << product_code
  end

  def total
    subtotal = calculate_subtotal
    discount = apply_discounts(subtotal)
    delivery_charge = calculate_delivery_charge(subtotal - discount)

    (subtotal - discount + delivery_charge).to_f / 100
  end

  private

  def calculate_subtotal
    @items.reduce(0) do |sum, item_code|
      sum + @products[item_code].price
    end
  end

  def apply_discounts(subtotal)
    @discounts.reduce(0) do |total_discount, discount|
      total_discount + PriceCalculator.new(@items, @products, discount.options).apply(discount.strategy, subtotal)
    end
  end

  def calculate_delivery_charge(total_after_discount)
    applicable_rule = @delivery_charges.find { |rule| rule.applicable?(total_after_discount) }
    applicable_rule ? applicable_rule.charge : 0
  end
end
