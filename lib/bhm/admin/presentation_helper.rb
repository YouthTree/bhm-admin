module BHM
  module Admin
    module PresentationHelper
      
      def value_with_default(v, default = BHM::Admin.t(:blank_value), &blk)
        inner = ""
        if v.present?
          inner = blk.present? ? capture(&blk) : v
        else
          inner = content_tag(:span, default, :class => 'default-value')
        end
        inner
      end

      alias vwd value_with_default
      
      def individual_resource_links(r, name = current_resource_name, opts = {}, &blk)
        items = [
          ml(BHM::Admin.t("buttons.show"), resource_url(r)),
          ml(BHM::Admin.t("buttons.edit"), edit_resource_url(r)),
          ml(BHM::Admin.t("buttons.remove"), resource_url(r), :method => :delete,
          :confirm => BHM::Admin.t("confirmation.destroy", :object_name => name))
        ]
        if blk.present?
          position = opts.fetch(:at, :before)
          value = capture(&blk)
          position == :before ? items.unshift(value) : items.push(value)
        end
        content_tag(:ul, items.join.html_safe)
      end

      def default_collection_columns
        klass = resource_class
        if klass.const_defined?(:INDEX_COLUMNS)
          klass::INDEX_COLUMNS
        else
          klass.column_names - [:created_at, :updated_at]
        end
      end

      def empty_row_for_collection(size = default_collection_columns.size)
        return if collection.present?
        name = current_resource_name
        inner = content_tag :td, BHM::Admin.t(:empty_row, :object_name => name.downcase, :plural_object_name => name.pluralize.downcase), :colspan => (size + 1)
        content_tag :tr, inner, :class => 'empty'
      end
      
    end
  end
end