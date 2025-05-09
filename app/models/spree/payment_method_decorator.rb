module Spree
  module PaymentMethodDecorator
    extend ActiveSupport::Concern

    included do
      scope :gift_card, -> { where(type: "Spree::PaymentMethod::GiftCard") }
    end

    def gift_card?
      self.class == Spree::PaymentMethod::GiftCard
    end
  end
end

Rails.application.config.to_prepare do
  Spree::PaymentMethod.include Spree::PaymentMethodDecorator
end
