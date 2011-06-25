module BHM
  module Admin
    class Engine < Rails::Engine

      config.bhm_admin = ActiveSupport::OrderedOptions.new

      def config.bhm_admin.build_menu(&blk)
        config.bhm_admin.menu_block = blk if blk.present?
      end

      config.action_view.stylesheet_expansions[:bhm_admin] = %w(bhm-admin)
      config.action_view.javascript_expansions[:bhm_admin] = %w(bhm-admin)

      initializer "bhm_admin.setup_configuration" do |app|
        options = app.config.bhm_admin
        options.each_pair do |key, value|
          BHM::Admin.send "#{key}=", value
        end
      end

      initializer "bhm_admin.setup_navigation" do |app|
        menu_block = app.config.bhm_admin.menu_block
        BHM::Admin.navigation(&menu_block) if menu_block.present?
      end

    end
  end
end