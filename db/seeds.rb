if Spree::Product.gift_cards.count == 0
  puts "\tCreating default gift card..."
  shipping_category = Spree::ShippingCategory.create(name: 'Gift Card')
  shipping_method = Spree::ShippingMethod.new(name: 'UPS Gift card', display_on: 'both')
  shipping_method.shipping_categories << shipping_category
  shipping_method.calculator = Spree::Calculator.create(type: 'Spree::Calculator::Shipping::FlatRate', preferences: { currency: "USD", amount: 0})
  shipping_method.save
  shipping_method.zones << Spree::Zone.all
  product = Spree::Product.new(available_on: Time.now, name: "Gift Card", is_gift_card: true, slug: 'gift-card', price: 0, shipping_category_id: shipping_category.id)
  option_type = Spree::OptionType.new(name: "is-gift-card", presentation: "Value")
  product.option_types << option_type
  [25, 50, 75, 100].each do |value|
    option_value = Spree::OptionValue.new(name: value, presentation: "$#{value}")
    option_value.option_type = option_type
    opts = { price: value.to_i, sku: "GIFTCERT#{value}" }
    variant = Spree::Variant.new(opts)
    variant.option_values << option_value
    product.variants << variant
  end
  product.save

end
unless Spree::PaymentMethod::GiftCard.all.exists?
  Spree::PaymentMethod::GiftCard.create(
    name: "Gift Card",
    description: "Pay by Gift Card",
    active: true,
    display_on: :both
  )
end
