class ObituaryController < ApplicationController
  before_action :find_obituary

  def show
    @exclude_banner = false
    @banner_title = "My obituary"
    @banner_url = "https://images.unsplash.com/photo-1557804506-669a67965ba0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1334&q=80"
  end

  def update
    if @obituary.update(obituary_params)
      if params[:obituary][:photos]
        @obituary.photos.attach(params[:obituary][:photos])
      end
      redirect_to obituary_path
    else
      render "/obituary/show"
    end
  end

  private

  def find_obituary
    @funeral = current_user.funeral
    @obituary = Obituary.find(params[:id])
    authorize @obituary
  end

  def obituary_params
    params.require(:obituary).permit(
      :last_words, :rich_body, :spotify_list, :death_date, :death_location, :funeral_time, :funeral_location, :funeral_info, guestlist: [])
  end
end
