class ObituaryController < ApplicationController
  before_action :find_obituary

  def show
    @exclude_banner = true
    @banner_title = "My obituary"
    @banner_url = "https://images.unsplash.com/photo-1596751303335-ca42b3ca50c1?ixlib=rb-1.2.1&auto=format&fit=crop&w=626&q=80"
  end

  def update
    if @obituary.update(obituary_params)
      if params[:obituary][:photos]
        @obituary.photos.attach(params[:obituary][:photos])
      end
      if current_user == @obituary.funeral.user
        redirect_to obituary_path
      else
        redirect_to representative_path(@funeral)
      end
    else
      render "/obituary/show"
    end
  end

  private

  def find_obituary
    @obituary = Obituary.find(params[:id])
    @funeral = @obituary.funeral
    authorize @obituary
  end

  def obituary_params
    params.require(:obituary).permit(
      :last_words, :rich_body, :spotify_list, :death_date, :death_location, :funeral_time, :funeral_location, :funeral_info, :public, guestlist: [])
  end
end
