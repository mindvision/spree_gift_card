module Spree
  module Stock
    module QuantifierDecorator
      extend ActiveSupport::Concern

      included do
        include Spree::QuantifierCanSupply
      end
    end
  end
end

Rails.application.config.to_prepare do
  Spree::Stock::Quantifier.include Spree::Stock::QuantifierDecorator
end
