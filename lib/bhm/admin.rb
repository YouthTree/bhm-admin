require 'active_support'
require 'nestive'

module BHM
  module Admin

    VERSION = "1.0.0.pre".freeze

    # Helpers for use in the admin area.
    autoload :SidebarHelper,      'bhm/admin/sidebar_helper'
    autoload :PresentationHelper, 'bhm/admin/presentation_helper'
    # General controller functionality.
    autoload :SidebarMixin,       'bhm/admin/sidebar_mixin'

    class << self
      attr_accessor :site_name
    end
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
      [SidebarHelper, PresentationHelper]
    end

    # Hook into rails.
    require 'bhm/admin/engine' if defined?(Rails::Engine)

  end
end
