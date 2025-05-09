module Spree
  module LineItemDecorator
    extend ActiveSupport::Concern

    included do
      MAXIMUM_GIFT_CARD_LIMIT = 1

      has_one :gift_card, dependent: :destroy

      with_options if: :is_gift_card? do
        validates :gift_card, presence: true
        validates :quantity, numericality: { less_than_or_equal_to: MAXIMUM_GIFT_CARD_LIMIT }, allow_nil: true
      end

      delegate :is_gift_card?, to: :product
    end
  end
end

Rails.application.config.to_prepare do
  Spree::LineItem.include Spree::LineItemDecorator
end
