require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  require 'factory_girl'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  # True headless javascript driver
  Capybara.javascript_driver = :webkit

  RSpec.configure do |config|
    # ## Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    # config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = false

    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run focus: true
    config.run_all_when_everything_filtered = true

    # Reduces stretches in sorcery to speed up tests

    Rails.application.config.sorcery.configure do |config|
      config.user_config do |user|
        user.stretches = 1 # Faster test methods
        user.consecutive_login_retries_amount_limit = 2 # This is not working :(
      end
    end

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    config.include FactoryGirl::Syntax::Methods
    config.include Sorcery::TestHelpers::Rails
    config.include LoginMacros, type: :request
    config.extend RoleMacros, type: :controller
    config.include CancanMacros, type: :controller
    config.include SorceryMacros, type: :controller
    config.include MailerMacros
    config.include I18nMacros, type: :request

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"

    config.before :suite do
      DatabaseCleaner[:active_record].strategy = :truncation
    end

    config.before :each do
      DatabaseCleaner[:active_record].start
      ActionMailer::Base.deliveries.clear
    end

    config.after :each do
      DatabaseCleaner[:active_record].clean
    end
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  FactoryGirl.reload
  silence_warnings do
    ActiveSupport::Dependencies.clear
  end
end
