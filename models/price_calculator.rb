class PriceCalculator
  def initialize(items, products, options)
    @items = items
    @products = products
    @options = options
  end

  def apply(type, subtotal)
    case type
    when 'ProductDiscount'
      apply_product_discount
    when 'ThresholdDiscount'
      apply_threshold_discount(subtotal)
    else
      0
    end
  end

  private

  def apply_product_discount
    quantity = @items.count(@options[:product_id])
    if quantity >= @options[:required_quantity]
      full_price = @products[@options[:product_id]].price
      discount_amount = full_price * @options[:discount_rate]
      discount_amount * (quantity / @options[:required_quantity])
    else
      0
    end
  end

  def apply_threshold_discount(subtotal)
    subtotal >= @options[:threshold] ? subtotal * @options[:discount_rate] : 0
  end
end
