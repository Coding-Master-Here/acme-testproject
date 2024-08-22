ROOT_PATH = File.expand_path('..', __dir__)
MODELS_PATH = File.join(ROOT_PATH, 'models')

autoload :Product, File.join(MODELS_PATH, 'product')
autoload :Basket, File.join(MODELS_PATH, 'basket')
autoload :DeliveryCharge, File.join(MODELS_PATH, 'delivery_charge')
autoload :Discount, File.join(MODELS_PATH, 'discount')
autoload :ProductDiscount, File.join(MODELS_PATH, 'discount_rules', 'product_discount')
autoload :ThresholdDiscount, File.join(MODELS_PATH, 'discount_rules', 'threshold_discount')
autoload :PriceCalculator, File.join(MODELS_PATH, 'price_calculator')

PRODUCTS = {
  'R01' => Product.new('R01', 'Red Widget', 3295),
  'G01' => Product.new('G01', 'Green Widget', 2495),
  'B01' => Product.new('B01', 'Blue Widget', 795)
}.freeze

DELIVERY_RULES = [
  DeliveryCharge.new(0, 5000, 495),
  DeliveryCharge.new(5000, 9000, 295),
  DeliveryCharge.new(9000, Float::INFINITY, 0)
].freeze

DISCOUNTS = [
  Discount.new('ProductDiscount', product_id: 'R01', required_quantity: 2, discount_rate: 0.5),
  Discount.new('ThresholdDiscount', threshold: 5000, discount_rate: 0.1)
].freeze
