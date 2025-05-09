module Spree
  module AdjustmentDecorator
    extend ActiveSupport::Concern

    included do
      scope :gift_card, -> { where(source_type: 'Spree::GiftCard') }
    end
  end
end

Rails.application.config.to_prepare do
  Spree::Adjustment.include Spree::AdjustmentDecorator
end
