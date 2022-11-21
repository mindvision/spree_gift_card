# API Controller to handle creating and adding gift card to orders.
module Spree
  module Api
    module V2
      module Storefront
        class GiftCardsController < ::Spree::Api::V2::Storefront::CartController
          def add_item
            spree_authorize! :update, spree_current_order, order_token
            spree_authorize! :show, @variant

            # Wrap the transaction script in a transaction so it is an atomic operation
            Spree::GiftCard.transaction do
              @gift_card = GiftCard.create!(gift_card_params)

              result = add_item_service.call(
                order: spree_current_order,
                variant: @variant,
                quantity: 1,
                public_metadata: add_item_params[:public_metadata],
                private_metadata: add_item_params[:private_metadata],
                options: { gift_card: @gift_card }
              )

              render_order(result)
            end
          end

          private

          def gift_card_params
            params.permit(:email, :name, :note, :variant_id)
          end
        end
      end
    end
  end
end
