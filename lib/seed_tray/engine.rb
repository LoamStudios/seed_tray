require "seed_tray/data_attribute_helper"

module SeedTray

  module Rails
    class Engine < ::Rails::Engine
      initializer 'data_attribute.helper' do |app|
        ActionView::Base.send :include, DataAttributeHelper
      end
    end
  end
  
end
