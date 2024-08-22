class Discount
  attr_reader :strategy, :options

  def initialize(strategy, options = {})
    @strategy = strategy
    @options = options
  end
end
