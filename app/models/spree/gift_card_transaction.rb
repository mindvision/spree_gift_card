module Spree
  module GiftCardTransactionConcern
    def self.prepended(base)
      base.belongs_to :gift_card
      base.belongs_to :order, required: false

      base.validates :amount, :gift_card, presence: true

      base.scope :authorize, -> { where(action: 'authorize') }
    end
  end

  GiftCardTransaction.prepend GiftCardTransactionConcern
end
