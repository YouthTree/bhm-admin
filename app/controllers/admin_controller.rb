class AdminController < ApplicationController
  include BHM::Admin::SidebarMixin

  layout "admin"

  before_filter :require_admin_authentication

  # helper Nestive::LayoutHelper
  helper *BHM::Admin.helper_classes

  protected

  def setup_attribute_scoping
  end

  def require_admin_authentication
    require_user  if respond_to?(:require_user)
    require_admin if respond_to?(:require_admin)
  end

end
