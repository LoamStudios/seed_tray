require "seed_tray/version"

module SeedTray
  require 'seed_tray/engine' if defined?(Rails)
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :suppress_console
  end

  self.configure do |config|
    config.suppress_console = false
  end
end
