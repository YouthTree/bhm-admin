require 'active_support'

module BHM
  module Admin
    
    # Helpers for use in the admin area.
    autoload :SidebarHelper,         'bhm/admin/sidebar_helper'
    autoload :PresentationHelper,    'bhm/admin/presentation_helper'
    autoload :NestedFormHelper,      'bhm/admin/nested_form_helper'
    autoload :AttrAccessibleScoping, 'bhm/admin/attr_accessible_scoping' 
    
    def self.t(*args)
      options = args.extract_options!
      options[:scope] = ["bhm.admin", options.delete(:scope)].flatten.compact.join(".")
      args.unshift args.shift.to_sym
      args.unshift options
      ::I18n.t(*args)
    end
    
    def root
      @_bhm_admin_root ||= Pathname(__FILE__).dirname.dirname.dirname.dirname
    end
    
    # Hook into rails.
    require 'bhm/admin/engine'            if defined?(Rails::Engine)
    require 'bhm/admin/compass_framework' if defined?(Compass)
    
  end
end