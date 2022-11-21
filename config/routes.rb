Spree::Core::Engine.add_routes do
  resources :gift_cards, only: [:new, :create] do
    member do
      get :redeem
    end
  end

  resources :orders, only: [] do
    patch :apply_gift_card
  end

  namespace :admin do
    resources :gift_cards
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v2 do
      namespace :storefront do
        resource :gift_card do
          post :add_item
        end
      end
    end
  end
end
