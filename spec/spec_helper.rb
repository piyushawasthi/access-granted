require 'rubygems'
require 'bundler/setup'

if ENV["COV"]
  require 'simplecov'
  SimpleCov.start
end
require 'pry'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end

module ActionController
  class Base
    def self.helper_method(*args)
    end
  end
end

require 'access-granted'

class FakeUser < Struct.new(:id, :is_moderator, :is_admin, :is_banned)
end

class FakePost < Struct.new(:id, :user_id)
end

class AccessPolicy
  include AccessGranted::Policy
end
