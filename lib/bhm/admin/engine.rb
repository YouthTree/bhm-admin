module BHM
  module Admin
    class Engine < Rails::Engine

      config.bhm_admin = ActiveSupport::OrderedOptions.new

      config.action_view.stylesheet_expansions[:bhm_admin] = %w(bhm-admin)
      config.action_view.javascript_expansions[:bhm_admin] = %w(bhm-admin)

      initializer "bhm_admin.setup_configuration" do |app|
        options = app.config.bhm_admin
        options.each_pair do |key, value|
          BHM::Admin.send "#{key}=", value
        end
      end

    end
  end
end