class DomainController < ApplicationController

  def create
    @website = current_user.websites.build(website_params)
    FetchRankJob.perform_later(@website) if @website.save
    redirect_to root_url
  end
  
  def destroy
    Website.destroy(params[:id])
    redirect_to root_url
  end
  
  private
    def website_params
      params.require(:website).permit(:url, :user_id, :collection_id)
    end
end
