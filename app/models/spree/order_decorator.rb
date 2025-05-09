module Spree
  module OrderDecorator
    extend ActiveSupport::Concern

    included do
      include Spree::Order::GiftCard
    end
  end
end

Rails.application.config.to_prepare do
  Spree::Order.include Spree::OrderDecorator
end
