module Spree
  module Api
    module V2
      module Storefront
        module CheckoutControllerDecorator
          extend ActiveSupport::Concern

          included do
            before_action :load_gift_card, :add_gift_card_payments, only: :update, if: :payment_via_gift_card?
            before_action :remove_gift_card_payments, only: [:update]
          end

          private

          ##
          # Add gift card payments to order
          # @return (Hash)
          def add_gift_card_payments
            order = spree_current_order
            order.add_gift_card_payments(@gift_card)

            render_serialized_payload(201) { serialize_resource(order.reload) }
          end

          ##
          # Retrieve first available gift card payment method
          # @return (Spree::PaymentMethod)
          def gift_card_payment_method
            @gift_card_payment_method ||= Spree::PaymentMethod.gift_card.available.first
          end

          ##
          # Load gift card via code supplied in params
          def load_gift_card
            gift_card_attributes = params[:order][:payments_attributes].
              find { |a| a[:payment_method_id] == gift_card_payment_method.id.to_s }
            code = gift_card_attributes[:source_attributes][:code]
            @gift_card = Spree::GiftCard.find_by(code: code)

            render_error_payload(Spree.t(:gift_code_not_found)) unless @gift_card
          end

          ##
          # Determine if paying with gift card by detecting if payment attributes include id for gift card
          # payment method
          # @return (Boolean)
          def payment_via_gift_card?
            if params[:order]
              payment_attributes = params[:order].fetch(:payments_attributes, {}).present?
              gift_card_method = params[:order][:payments_attributes]&.select do |payments_attribute|
                gift_card_payment_method.try(:id).to_s == payments_attribute[:payment_method_id]
              end.present?

              payment_attributes && gift_card_method
            end
          end

          ##
          # Remove gift card payments from order
          def remove_gift_card_payments
            order = spree_current_order

            if params.key?(:remove_gift_card) && order.using_gift_card?
              order.remove_gift_card_payments
              render_serialized_payload(201) { serialize_resource(order.reload) }
            end
          end
        end
      end
    end
  end
end

Spree::Api::V2::Storefront::CheckoutController.include Spree::Api::V2::Storefront::CheckoutControllerDecorator