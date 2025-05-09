module Spree
  module GiftCardTransactionConcern
    extend ActiveSupport::Concern

    included do
      belongs_to :gift_card
      belongs_to :order, required: false

      validates :amount, :gift_card, presence: true

      scope :authorize, -> { where(action: 'authorize') }
    end
  end

  class GiftCardTransaction < ActiveRecord::Base
    include GiftCardTransactionConcern
  end
end
