module Spree
  module OrderDecorator
    def self.prepended(base)
      base.include Spree::Order::GiftCard
    end
  end
  Order.prepend Spree::OrderDecorator
end
