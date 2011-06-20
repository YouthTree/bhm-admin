module BHM
  module Admin
    class TableBuilder

      Field = Struct.new(:name, :options, :block)

      attr_reader :template

      def initialize(template)
        @template = template
        @fields   = []
      end

      def column(name, options = {}, &blk)
        blk ||= proc { |object| concat object.send(name).to_s }
        @fields << Field.new(name, options, &blk)
      end

      def build_header_entry(field, klass)
        value = field.options[:title] || klass.human_attribute_name(field.name)
        template.content_tag :th, value
      end

      def build_entry(field, object)
        inner = template.capture { field.block.call object }
        template.content_tag :td, inner
      end

      def build!(collection)
        klass = collection.first.class
      end

      protected

    end
  end
end