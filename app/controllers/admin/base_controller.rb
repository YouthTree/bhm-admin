class Admin::BaseController < AdminController

  inherit_resources

  protected

  def collection
    get_collection_ivar || set_collection_ivar(end_of_association_chain.paginate(:page => params[:page]))
  end

  def resource
    get_resource_ivar || set_resource_ivar(find_instance_with_type_detection)
  end

  def find_instance_with_type_detection
    eoac = end_of_association_chain
    if eoac.respond_to?(:find_using_slug!)
      eoac.find_using_slug! params[:id]
    else
      eoac.find params[:id]
    end
  end

end