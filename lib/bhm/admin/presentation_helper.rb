module BHM
  module Admin
    module PresentationHelper

      def value_with_default(v, default = ta(:blank_value), &blk)
        inner = ActiveSupport::SafeBuffer.new
        if v.present?
          inner = blk.present? ? capture(&blk) : v
        else
          inner = content_tag(:span, default, :class => 'default-value')
        end
        inner
      end

      alias vwd value_with_default

      def individual_resource_links(r, name = current_resource_name, opts = {}, &blk)
        items = with_safe_buffer do |buffer|
          buffer << ml(ta("buttons.show"), resource_url(r))
          buffer << ml(ta("buttons.edit"), edit_resource_url(r))
          buffer << ml(ta("buttons.destroy"), resource_url(r), :method => :delete, :confirm => ta("confirmation.destroy", :object_name => name))
        end
        if blk.present?
          position = opts.fetch(:at, :before)
          value    = capture(&blk)
          if position == :before
            items.unshift value
          else
            items << value
          end
        end
        content_tag :ul, items
      end

      def empty_row_for_collection
        return if collection.present?
        name = current_resource_name
        inner = content_tag :td, BHM::Admin.t(:empty_row, :object_name => name.downcase, :plural_object_name => name.pluralize.downcase), :colspan => (size + 1)
        content_tag :tr, inner, :class => 'empty'
      end

      def humanized_errors_on(object)
        if object.errors[:base].present?
          errors       = content_tag(:p, BHM::Admin.t('errors.heading'))
          inner_errors = object.errors[:base].map { |e| content_tag(:li, e) }.sum(ActiveSupport::SafeBuffer.new)
          errors      << content_tag(:ul, inner_errors)
          content_tag :div, errors, :class => 'resource-base-errors'
        end
      end

      def ta(*args)
        BHM::Admin.t *args
      end

    end
  end
end