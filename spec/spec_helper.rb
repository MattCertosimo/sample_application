require 'rubygems'
require 'spork'

Spork.prefork do
  #Loading more in this block will cause your test to run faster. However,
  #if you change any configuration or code from libraries loaded here, you'll
  #need to restart spork for it to take effect.
  #This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  # Requires supporting ruby files with custom matchers and macros, ect,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  Rspec.configure do |config|
      # == Mock Framework
      #
      #if you prefer mocha, or flexmock or rr uncoment the appropriate line
      #
      # config.mock_with :mocha
      # config.mock_with :flexmock
      # config.mock_with :rr
      config.mock_with :rspec

    #Remove this line if you're not using ActiveRecord or ActiveRecord foxtire
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    #if your not using active record, or you'd prefer not to run each of your
    #examples within a transaction, remove the following line or assign false
    #instead of true
    config.use_transactional_fixtures = true

    #if true, the base class of anonymous controllers will be inferred
    #automatically. this will be the default behabior in future versions of
    #rspec-rails
    config.infer_base_class_for_anonymous_controllers = false
  end
end

Spork.each_run do
  #this code will be run each time you run your specs.
end