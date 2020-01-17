ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  include Warden::Test::Helpers
  Warden.test_mode!
  include Devise::Test::IntegrationHelpers

  # def current_user
  #   remember_token = User.encrypt(cookies[:user_remember_token])
  #   @current_user ||= User.find_by(remember_token: remember_token)
  # end

  # def sign_in(user)
  #   remember_token = User.new_remember_token
  #   cookies.permanent[:user_remember_token] = remember_token
  #   user.update!(remember_token: User.encrypt(remember_token))
  #   @current_user = user
  # end

  # def sign_out
  #   @current_user = nil
  #   cookies.delete(:user_remember_token)
  # end

  # def logged_in?
  #   @current_user.present?
  # end
end
