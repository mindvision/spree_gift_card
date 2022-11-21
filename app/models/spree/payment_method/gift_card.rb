module Spree
  class PaymentMethod::GiftCard < PaymentMethod
    def payment_source_class
      ::Spree::GiftCard
    end

    def actions
      %w{capture void}
    end

    def can_void?(payment)
      payment.pending?
    end

    def can_capture?(payment)
      ['checkout', 'pending'].include?(payment.state)
    end

    def authorize(amount_in_cents, gift_card, gateway_options = {})
      order = Spree::Order.find_by(number: get_order_number(gateway_options))
      return ActiveMerchant::Billing::Response.new(false, Spree.t('gift_card_payment_method.cannot_buy_from_gift_card'), {}, {}) if order_with_gift_card?(order)
      if gift_card.nil? || !gift_card.enabled || order.email != gift_card.email
        ActiveMerchant::Billing::Response.new(false, Spree.t('gift_card_payment_method.unable_to_find'), {}, {})
      else
        action = -> (gift_card) do
          gift_card.authorize(amount_in_cents / 100.0.to_d, order_number: get_order_number(gateway_options))
        end
        handle_action_call(gift_card, action, :authorize)
      end
    end

    def capture(amount_in_cents, auth_code, gateway_options = {})
      action = -> (gift_card) do
        gift_card.capture(amount_in_cents / 100.0.to_d, auth_code, order_number: get_order_number(gateway_options))
      end
      handle_action(action, :capture, auth_code)
    end

    def void(auth_code, gateway_options = {})
      action = -> (gift_card) do
        gift_card.void(auth_code, order_number: get_order_number(gateway_options))
      end
      handle_action(action, :void, auth_code)
    end

    def purchase(amount_in_cents, gift_card, gateway_options = {})
      order = Spree::Order.find_by(number: get_order_number(gateway_options))
      return ActiveMerchant::Billing::Response.new(false, Spree.t('gift_card_payment_method.cannot_buy_from_gift_card'), {}, {}) if order_with_gift_card?(order)
      if gift_card.nil? || !gift_card.enabled || order.email != gift_card.email
        ActiveMerchant::Billing::Response.new(false, Spree.t('gift_card_payment_method.unable_to_find'), {}, {})
      else
        action = -> (gift_card) do
          purchase_amount = amount_in_cents / 100.0.to_d
          (authorize_code = gift_card.authorize(purchase_amount, order_number: get_order_number(gateway_options))) && gift_card.capture(purchase_amount, authorize_code, order_number: get_order_number(gateway_options))
        end
        handle_action_call(gift_card, action, :authorize)
      end
    end

    def credit(amount_in_cents, auth_code, gateway_options = {})
      action = -> (gift_card) do
        gift_card.credit(amount_in_cents / 100.0.to_d, auth_code, order_number: get_order_number(gateway_options))
      end

      handle_action(action, :credit, auth_code)
    end

    def source_required?
      true
    end

    private

    def order_with_gift_card?(order)
      order.line_items.map(&:product).any? { |p| p.is_gift_card? }
    end

    def handle_action_call(gift_card, action, action_name, auth_code = nil)
      gift_card.with_lock do
        if response = action.call(gift_card)
          ActiveMerchant::Billing::Response.new(
            true,
            Spree.t('gift_card_payment_method.successful_action', action: action_name),
            {},
            authorization: auth_code || response
          )
        else
          ActiveMerchant::Billing::Response.new(false, gift_card.errors.full_messages.join, {}, {})
        end
      end
    end

    def handle_action(action, action_name, auth_code)
      gift_card = GiftCardTransaction.find_by(authorization_code: auth_code).try(:gift_card)

      if gift_card.nil?
        ActiveMerchant::Billing::Response.new(
          false,
          Spree.t('gift_card_payment_method.unable_to_find_for_action', auth_code: auth_code, action: action_name),
          {},
          {}
        )
      else
        handle_action_call(gift_card, action, action_name, auth_code)
      end
    end

    def get_order_number(gateway_options)
      gateway_options[:order_id].split('-').first if gateway_options[:order_id]
    end
  end
end
