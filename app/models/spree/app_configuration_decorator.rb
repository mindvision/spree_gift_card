Spree::AppConfiguration.class_eval do
  if respond_to?(:preference)
    preference :allow_gift_card_redeem, :boolean, default: true
  else
    Rails.logger.warn "Preference method is not defined on Spree::AppConfiguration"
  end
 end 