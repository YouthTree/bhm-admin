require 'active_support'

module BHM
  module Admin
    
    VERSION = "0.1.1".freeze
    
    # Helpers for use in the admin area.
    autoload :SidebarHelper,         'bhm/admin/sidebar_helper'
    autoload :PresentationHelper,    'bhm/admin/presentation_helper'
    autoload :NestedFormHelper,      'bhm/admin/nested_form_helper'
    autoload :AttrAccessibleScoping, 'bhm/admin/attr_accessible_scoping' 
    
    class << self; attr_accessor :site_name; end
    self.site_name ||= "Your Website"
    
    def self.t(*args)
      options = args.extract_options!
      options[:scope] = ["bhm.admin", options.delete(:scope)].flatten.compact.join(".")
      args.unshift args.shift.to_sym
      args << options
      ::I18n.t(*args)
    end
    
    def self.root
      @_bhm_admin_root ||= Pathname(__FILE__).dirname.dirname.dirname
    end
    
    def self.helper_classes
      [SidebarHelper, PresentationHelper, NestedFormHelper]
    end
    
    # Hook into rails.
    require 'bhm/admin/engine'            if defined?(Rails::Engine)
    require 'bhm/admin/compass_framework' if defined?(Compass)
    
  end
end