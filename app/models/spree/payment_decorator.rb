module Spree
  module PaymentDecorator
    extend ActiveSupport::Concern

    included do
      scope :gift_cards, -> { where(source_type: Spree::GiftCard.to_s) }

      delegate :gift_card?, to: :payment_method, allow_nil: true

      state_machine.after_transition to: :completed, do: :process_gift_card

      private

      def invalidate_old_payments
        return if store_credit_or_gift_card?
        order.payments.with_state('checkout').where("id != ?", self.id).each do |payment|
          payment.invalidate! unless payment.store_credit_or_gift_card?
        end
      end
    end

    def process_gift_card
      order.line_items.each do |li|
        if li.gift_card
          li.gift_card.update_column(:enabled, true)
          Spree::OrderMailer.gift_card_email(li.gift_card.id, order).deliver_later
        end
      end
    end

    def store_credit_or_gift_card?
      store_credit? || gift_card?
    end
  end
end

Rails.application.config.to_prepare do
  Spree::Payment.include Spree::PaymentDecorator
end
