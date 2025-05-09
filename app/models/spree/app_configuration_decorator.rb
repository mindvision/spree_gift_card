module Spree
  module AppConfigurationDecorator
    extend ActiveSupport::Concern

    included do
      if respond_to?(:preference)
        preference :allow_gift_card_redeem, :boolean, default: true
      else
        Rails.logger.warn "Preference method is not defined on Spree::AppConfiguration"
      end
    end
  end
end

Rails.application.config.to_prepare do
  Spree::AppConfiguration.include Spree::AppConfigurationDecorator
end