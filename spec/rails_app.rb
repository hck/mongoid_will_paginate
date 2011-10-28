require 'action_controller/railtie'
require 'action_view/railtie'
require 'digest/md5'

app = Class.new(Rails::Application)
app.config.secret_token = Digest::MD5.hexdigest("mongoid_will_paginate")
app.config.session_store :cookie_store, :key => "_test_rails_app_session"
app.config.active_support.deprecation = :log
app.initialize!
