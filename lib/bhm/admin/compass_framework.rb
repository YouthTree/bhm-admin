module BHM
  module Admin
    
    def self.register_compass_framework!
      root_path = File.expand_path('../../../compass', File.dirname(__FILE__))
      Compass::Frameworks.register 'bhm-admin',
        :stylesheets_directory => File.join(root_path, 'stylesheets'),
        :templates_directory   => File.join(root_path, 'templates')
    end
    
    register_compass_framework!
    
  end
end