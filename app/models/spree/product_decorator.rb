module Spree
  module ProductDecorator
    extend ActiveSupport::Concern

    included do
      scope :gift_cards, -> { where(is_gift_card: true) }
      scope :not_gift_cards, -> { where(is_gift_card: false) }
    end
  end
end

Rails.application.config.to_prepare do
  Spree::Product.include Spree::ProductDecorator
end
