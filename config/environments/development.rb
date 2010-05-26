# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

ActionController::Base.session = {
  :key         => '_eventsnow_dev_session',
  :secret      => '6a1fe2b59b5b7b542e8bd3d7327a3037c006679b76b897bc87638d080da7ff2a6448302532b4d4fa14aee79fd7e4c9d37862b17c4257db24991c8a691a32c9c8'
}