module Spree
  module Stock
    module QuantifierDecorator
      def self.prepended(base)
        base.include Spree::QuantifierCanSupply
      end
    end
  end
  Stock::Quantifier.prepend Stock::QuantifierDecorator
end
