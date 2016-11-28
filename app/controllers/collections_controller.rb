class CollectionsController < ApplicationController
  
  protect_from_forgery 
  def create
    @collection = current_user.collections.build(collection_params)
    @collection.save
    last_id = Collection.maximum('id')
    @domains = Website.where(:user_id => current_user)
    @domains.where("collection_id IS ?", nil).update( collection_id: last_id )
    redirect_to root_url
  end
  def collection

  end
 
  def show
 
  end

  def destroy
    Collection.destroy(params[:id])
    Website.where(:collection_id => params[:id]).destroy_all
    redirect_to root_url
  end

  
  private
    def collection_params
      params.require(:collection).permit(:name, :user_id)
    end

end