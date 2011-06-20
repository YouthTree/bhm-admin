module BHM
  module Admin
    module SidebarHelper

      def bhm_admin_sidebar_content
        area :sidebar
      end

      # Do we have a sidebar?
      def bhm_admin_has_sidebar?
        bhm_admin_sidebar_content.present? && show_sidebar?
      end

      def collection_sidebar
        sidebar_menu(parent_sidebar_content + resources_sidebar_content)
      end

      def object_sidebar
        name = current_resource_name
        inner_menu = parent_sidebar_content + resources_sidebar_content(name) + resource_sidebar_content(name)
        sidebar_menu(inner_menu)
      end

      def sidebar_menu(inner_content = nil, &blk)
        default_content = with_safe_buffer do |buffer|
          buffer << inner_content if inner_content.present?
          buffer << capture(&blk) if block_given?
        end
        content_tag :ul, area(:inner_sidebar, default_content), :class => 'sidebar-menu'
      end

      def sidebar_klass_name(klass)
        controller_i18n_path = controller.controller_path.split("/").join(".")
        ta(controller_i18n_path.to_sym, :scope => :model_name, :default => klass.model_name.human)
      end

      def current_resource_name
        sidebar_klass_name(resource_class).titleize
      end

      def current_parent_name
        sidebar_klass_name(parent_class).titleize
      end

      def container_classes_css
        if bhm_admin_has_sidebar?
          'with-sidebar'
        else
          'full-width'
        end
      end

      def parent_sidebar_content
        with_safe_buffer do |content|
          if respond_to?(:parent?) && parent?
            parent_name = current_parent_name
            content << ml(ta('actions.show', :object_name => parent_url), parent_url)
            content << ml(ta('actions.edit', :object_name => parent_url), "#{parent_url}/edit")
          end
        end
      end

      def resources_sidebar_content(name = current_resource_name)
        with_safe_buffer do |content|
          content << ml(ta('actions.edit', :object_name => name.pluralize), collection_url)
          content << ml(ta('actions.new', :object_name => name), new_resource_url)
        end
      end

      def resource_sidebar_content(name = current_resource_name)
        with_safe_buffer do |content|
          content << ml(ta('actions.show', :object_name => name), resource_url)
          content << ml(ta('actions.edit', :object_name => name), edit_resource_url)
          content << ml(ta('actions.destroy', :object_name => name), resource_url, :method => :delete,
            :confirm => ta("confirmation.destroy", :object_name => name))
        end
      end

      def with_safe_buffer(&blk)
        ActiveSupport::SafeBuffer.new.tap(&blk)
      end

    end
  end
end