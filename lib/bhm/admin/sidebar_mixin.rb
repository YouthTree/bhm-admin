module BHM
  module Admin
    module SidebarMixin

      extend ActiveSupport::Concern

      included do
        helper_method :show_sidebar?, :hide_sidebar?
      end

      module InstanceMethods

        protected

        def show_sidebar!
          @hide_sidebar = false
        end

        def hide_sidebar!
          @hide_sidebar = true
        end

        def show_sidebar?
          !hide_sidebar?
        end

        def hide_sidebar?
          defined?(@hide_sidebar) && @hide_sidebar
        end

      end

      module ClassMethods

        def show_sidebar!(opts = {})
          before_filter :show_sidebar!, opts
        end

        def hide_sidebar!(opts = {})
          before_filter :hide_sidebar!, opts
        end

      end

    end
  end
end