require 'json_api_client'

require 'productive/version'
require 'productive/configuration'
require 'productive/resources/base'
require 'productive/resources/client'
require 'productive/resources/person'
require 'productive/resources/project'

require 'productive/railtie' if defined?(Rails::Railtie)

module Productive
  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Productive::Configuration.new
    end
  end
end
