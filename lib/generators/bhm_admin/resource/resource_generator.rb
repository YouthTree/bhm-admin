module BhmAdmin
  module Generators
    class ResourceGenerator < Rails::Generators::NamedBase
      
      def self.source_root
        @_bar_source_root ||= File.expand_path("templates", File.dirname(__FILE__))
      end
      
      check_class_collision :suffix => "Controller", :prefix => "Admin::"
      
      def create_controller_files
        template 'controller.rb', File.join('app/controllers/admin', class_path, "#{file_name}_controller.rb")
      end
      
      def create_template_files
        base_path = File.join("app/views/admin", class_path, file_name)
        empty_directory base_path
        %w(new edit index show _form).each do |view|
          sub_path = "#{view}.html.haml"
          template sub_path, File.join(base_path, sub_path)
        end
      end
      
    end
  end
end