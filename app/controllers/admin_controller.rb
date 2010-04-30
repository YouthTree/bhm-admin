class AdminController < ApplicationController
  
  before_filter :require_admin_authentication
  around_filter :disable_attr_accessible
  
  protected
  
  def disable_attr_accessible
    AttrAccessibleScoping.disable { yield }
  end
  
  def require_admin_authentication
    require_user  if respond_to?(:require_user)
    require_admin if respond_to?(:require_admin)
  end
  
end
