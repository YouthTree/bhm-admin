class AdminController < ApplicationController

  layout "admin"
  
  before_filter :require_admin_authentication
  around_filter :disable_attr_accessible
  
  helper *BHM::Admin.helper_classes
  
  protected
  
  def disable_attr_accessible
    BHM::Admin::AttrAccessibleScoping.disable { yield }
  end
  
  def require_admin_authentication
    require_user  if respond_to?(:require_user)
    require_admin if respond_to?(:require_admin)
  end
  
end
