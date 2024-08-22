class ProductDiscount < Discount
  def apply(items, products)
    product_code = options[:product_id]
    quantity = items.count(product_code)

    return 0 if quantity < 2

    full_price = products[product_code].price
    discount_amount = full_price * 0.5

    discount_amount * (quantity / 2)
  end
end
