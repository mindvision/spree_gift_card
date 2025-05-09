module Spree
  module StoreCreditCategoryDecorator
    extend ActiveSupport::Concern

    included do
      scope :gift_card, -> { where(name: 'Gift Card') }
    end
  end
end

Rails.application.config.to_prepare do
  Spree::StoreCreditCategory.include Spree::StoreCreditCategoryDecorator
end
