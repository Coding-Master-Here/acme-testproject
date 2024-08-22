class ThresholdDiscount < Discount
  def apply(subtotal)
    threshold = options[:threshold] || 0
    discount_rate = options[:discount_rate] || 0

    subtotal >= threshold ? subtotal * discount_rate : 0
  end
end
