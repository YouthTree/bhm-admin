module BhmAdmin
  module Generators
    class ResourceGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      
      def self.source_root
        @_bar_source_root ||= File.expand_path("templates", File.dirname(__FILE__))
      end
      
      check_class_collision :suffix => "Controller", :prefix => "Admin::"
      
      def create_controller_files
        actual_class_path = controller_class_path + ["#{controller_file_path}_controller.rb"]
        template 'controller.rb', File.join('app/controllers/admin', *actual_class_path)
      end
      
      def create_template_files
        base_path = File.join("app/views/admin", *(controller_class_path + [controller_file_path]))
        empty_directory base_path
        %w(new edit index show _form).each do |view|
          sub_path = "#{view}.html.haml"
          template sub_path, File.join(base_path, sub_path)
        end
      end
      
    end
  end
end