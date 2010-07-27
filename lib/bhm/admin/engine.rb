module BHM
  module Admin
    class Engine < Rails::Engine
      
      initializer :extend_activerecord do
        ActiveRecord::Base.extend BHM::Admin::AttrAccessibleScoping::ARMixin
      end
      
    end
  end
end