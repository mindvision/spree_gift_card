# -*- encoding: utf-8 -*-
# stub: spree_gift_card 4.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "spree_gift_card".freeze
  s.version = "4.4.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Reitano".freeze]
  s.date = "2025-04-14"
  s.description = "Spree Gift Card Extension".freeze
  s.email = ["michael@mindvision.com.au".freeze]
  s.files = [".gitignore".freeze, "Appraisals".freeze, "Gemfile".freeze, "LICENSE".freeze, "README.md".freeze, "Rakefile".freeze, "app/assets/javascripts/spree/backend/spree_gift_card.js".freeze, "app/assets/javascripts/spree/frontend/spree_gift_card.js".freeze, "app/assets/stylesheets/spree/backend/spree_gift_card.css".freeze, "app/assets/stylesheets/spree/frontend/spree_gift_card.css".freeze, "app/controllers/spree/admin/gift_cards_controller.rb".freeze, "app/controllers/spree/admin/payments_controller_decorator.rb".freeze, "app/controllers/spree/api/v2/storefront/checkout_controller_decorator.rb".freeze, "app/controllers/spree/api/v2/storefront/gift_cards_controller.rb".freeze, "app/controllers/spree/checkout_controller_decorator.rb".freeze, "app/controllers/spree/gift_cards_controller.rb".freeze, "app/controllers/spree/products_controller_decorator.rb".freeze, "app/helpers/spree/admin/gift_cards_helper.rb".freeze, "app/helpers/spree/gift_cards_helper.rb".freeze, "app/mailers/spree/order_mailer_decorator.rb".freeze, "app/models/concerns/spree/order/gift_card.rb".freeze, "app/models/concerns/spree/quantifier_can_supply.rb".freeze, "app/models/spree.rb".freeze, "app/models/spree/adjustment_decorator.rb".freeze, "app/models/spree/app_configuration_decorator.rb".freeze, "app/models/spree/calculator/gift_card_calculator.rb".freeze, "app/models/spree/gift_card.rb".freeze, "app/models/spree/gift_card_transaction.rb".freeze, "app/models/spree/line_item_decorator.rb".freeze, "app/models/spree/order_decorator.rb".freeze, "app/models/spree/payment_decorator.rb".freeze, "app/models/spree/payment_method/gift_card.rb".freeze, "app/models/spree/payment_method_decorator.rb".freeze, "app/models/spree/product_decorator.rb".freeze, "app/models/spree/stock/quantifier_decorator.rb".freeze, "app/models/spree/store_credit_category_decorator.rb".freeze, "app/overrides/spree/admin/general_settings/edit/_gift_card_settings.html.erb.deface".freeze, "app/overrides/spree/admin/products/_form/insert_bottom_admin_product_form_right.html.erb.deface".freeze, "app/overrides/spree/admin/shared/_main_menu/_add_gift_cards_tab.html.erb.deface".freeze, "app/overrides/spree/checkout/_summary/_gift_card_details.html.erb.deface".freeze, "app/overrides/spree/orders/_line_item/replace_cart_item_quantity.html.erb.deface".freeze, "app/overrides/spree/orders/_line_item/replace_contents_cart_item_description.html.erb.deface".freeze, "app/overrides/spree/shared/_order_details/insert_bottom_order_item_description.html.erb.deface".freeze, "app/overrides/spree/shared/_sidebar/insert_bottom_sidebar.html.erb.deface".freeze, "app/services/spree/checkout/add_store_credit_decorator.rb".freeze, "app/views/spree/admin/gift_cards/_form.html.erb".freeze, "app/views/spree/admin/gift_cards/edit.html.erb".freeze, "app/views/spree/admin/gift_cards/index.html.erb".freeze, "app/views/spree/admin/gift_cards/new.html.erb".freeze, "app/views/spree/admin/payments/source_forms/_giftcard.html.erb".freeze, "app/views/spree/admin/payments/source_views/_giftcard.html.erb".freeze, "app/views/spree/checkout/payment/_giftcard.html.erb".freeze, "app/views/spree/gift_cards/new.html.erb".freeze, "app/views/spree/order_mailer/gift_card_email.html.erb".freeze, "config/locales/en.yml".freeze, "config/routes.rb".freeze, "db/migrate/20101008115306_add_gift_card_attr_to_spree_products.rb".freeze, "db/migrate/20101011103850_create_spree_gift_cards.rb".freeze, "db/migrate/20121017183422_create_spree_gift_card_transactions.rb".freeze, "db/migrate/2013080702300_upgrade_gift_card_adjustments.rb".freeze, "db/migrate/20161012071043_add_action_and_authorization_code_to_spree_gift_card_transaction.rb".freeze, "db/migrate/20161012102321_add_authorized_amount_to_spree_gift_card.rb".freeze, "db/migrate/20180404061553_add_enable_field_to_gift_card.rb".freeze, "db/seeds.rb".freeze, "gemfiles/spree_3_2.gemfile".freeze, "gemfiles/spree_3_3.gemfile".freeze, "gemfiles/spree_3_4.gemfile".freeze, "gemfiles/spree_3_5.gemfile".freeze, "gemfiles/spree_3_6.gemfile".freeze, "gemfiles/spree_3_7.gemfile".freeze, "gemfiles/spree_master.gemfile".freeze, "lib/generators/spree_gift_card/install_generator.rb".freeze, "lib/generators/spree_gift_card/seed_generator.rb".freeze, "lib/spree_gift_card.rb".freeze, "lib/spree_gift_card/engine.rb".freeze, "lib/spree_gift_card/factories.rb".freeze, "lib/tasks/spree_gift_card.rake".freeze, "script/rails".freeze, "spec/factories/gift_cards.rb".freeze, "spec/features/add_to_card_spec.rb".freeze, "spec/features/admin/gift_card_administration_spec.rb".freeze, "spec/features/admin/gift_card_payment_spec.rb".freeze, "spec/features/checkout_spec.rb".freeze, "spec/features/purchase_spec.rb".freeze, "spec/models/spree/app_configuration_decorator_spec.rb".freeze, "spec/models/spree/calculator/gift_card_spec.rb".freeze, "spec/models/spree/gift_card_spec.rb".freeze, "spec/models/spree/gift_card_transaction_spec.rb".freeze, "spec/models/spree/line_item_spec.rb".freeze, "spec/models/spree/order/gift_card_spec.rb".freeze, "spec/models/spree/payment_decorator_spec.rb".freeze, "spec/models/spree/payment_method/gift_card_spec.rb".freeze, "spec/models/spree/stock/quantifier_spec.rb".freeze, "spec/spec_helper.rb".freeze, "spree_gift_card.gemspec".freeze]
  s.homepage = "https://mindvision.com.au".freeze
  s.required_ruby_version = Gem::Requirement.new("~> 3.3.0".freeze)
  s.requirements = ["none".freeze]
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Spree Gift Card".freeze

  s.installed_by_version = "3.6.8".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<spree_api>.freeze, [">= 4.4.0".freeze])
  s.add_runtime_dependency(%q<spree_backend>.freeze, [">= 4.4.0".freeze])
  s.add_runtime_dependency(%q<spree_core>.freeze, [">= 4.4.0".freeze])
  s.add_runtime_dependency(%q<spree_frontend>.freeze, [">= 4.4.0".freeze])
  s.add_runtime_dependency(%q<spree_extension>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<appraisal>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<byebug>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<capybara>.freeze, ["~> 2.6".freeze])
  s.add_development_dependency(%q<coffee-rails>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<database_cleaner>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<factory_bot>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<ffaker>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.4".freeze])
  s.add_development_dependency(%q<sass-rails>.freeze, ["~> 5.0.4".freeze])
  s.add_development_dependency(%q<selenium-webdriver>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<shoulda-matchers>.freeze, ["~> 3.1.1".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<sqlite3>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec-activemodel-mocks>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rails-controller-testing>.freeze, ["~> 1.0.1".freeze])
  s.add_development_dependency(%q<poltergeist>.freeze, [">= 0".freeze])
end
