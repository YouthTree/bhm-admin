module BHM
  module Admin
    module SidebarHelper
      
      def hide_sidebar!
        content_for :sidebar, '&nbsp;'.html_safe
      end
      
      def collection_sidebar
        sidebar_menu(parent_sidebar_content + resources_sidebar_content)
      end

      def object_sidebar
        name = current_resource_name
        inner_menu = parent_sidebar_content + resources_sidebar_content(name) + resource_sidebar_content(name)
        sidebar_menu(inner_menu)
      end

      def menu_link(*args, &blk)
        content_tag(:li, link_to(*args, &blk), :class => 'menu-item')
      end
      alias ml menu_link

      def sidebar_menu(inner_content = nil, &blk)
        content = []
        content << content_for(:sidebar_menu_start) if content_for?(:sidebar_menu_start)
        content << inner_content.to_s if inner_content
        content << capture(&blk) if blk.present?
        content << content_for(:sidebar_menu_end) if content_for?(:sidebar_menu_end)
        content = content_tag(:ul, content.join("").html_safe, :class => 'sidebar-menu')
        content
      end

      def sidebar_klass_name(klass)
        controller_i18n_path = controller.controller_path.split("/").join(".")
        BHM::Admin.t(controller_i18n_path.to_sym, :scope => :model_name, :default => klass.model_name.human)
      end

      def current_resource_name
        sidebar_klass_name(resource_class).titleize
      end

      def current_parent_name
        sidebar_klass_name(parent_class).titleize
      end
      
      def parent_sidebar_content
        returning ActiveSupport::SafeBuffer.new do |content|
          if respond_to?(:parent?) && parent?
            parent_name = current_parent_name
            content << ml("View #{parent_name}", parent_url)
            content << ml("Edit #{parent_name}", File.join(parent_url, 'edit'))
          end
        end
      end

      def resources_sidebar_content(name = current_resource_name)
        returning ActiveSupport::SafeBuffer.new do |content|
          content << ml("All #{name.pluralize}", collection_url)
          content << ml("Add #{name}", new_resource_url)
        end
      end

      def resource_sidebar_content(name = current_resource_name)
        returning ActiveSupport::SafeBuffer.new do |content|
          content << ml("View #{name}", resource_url)
          content << ml("Edit #{name}", edit_resource_url)
          content << ml("Remove #{name}", resource_url, :method => :delete,
            :confirm => BHM::Admin.t("confirmation.destroy", :object_name => name))
        end
      end
      
    end
  end
end