class ObituaryController < ApplicationController
  before_action :find_obituary

  def show
  end

  def update
    if @obituary.update(obituary_params)
      redirect_to obituary_path
    else
      render "/obituary/show"
    end
  end

  private

  def find_obituary
    @funeral = current_user.funeral
    @obituary = Obituary.find(params[:id])
  end

  def obituary_params
    params.require(:obituary).permit(
      :last_words, :spotify_list, :death_date, :death_location, :funeral_time, :funeral_location, :funeral_info)
  end
end