class DeliveryCharge
  attr_reader :min_amount, :max_amount, :charge

  def initialize(min_amount, max_amount, charge)
    @min_amount = min_amount
    @max_amount = max_amount
    @charge = charge
  end

  def applicable?(total_amount)
    total_amount >= min_amount && total_amount < max_amount
  end
end
