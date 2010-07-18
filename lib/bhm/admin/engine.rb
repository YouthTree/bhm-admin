module BHM
  module Admin
    class Engine < Rails::Engine
            
      # paths.config.locales     = BHM::Admin.root.join('config', 'locales')
      # paths.config.controllers = BHM::Admin.root.join('app', 'controller')
      # paths.config.views       = BHM::Admin.root.join('app', 'views')
      
      initializer :configure_compass do
      end
      
      initializer :extend_activerecord do
        ActiveRecord::Base.send :include, BHM::Admin::AttrAccessibleScoping::ARMixin
      end
      
    end
  end
end