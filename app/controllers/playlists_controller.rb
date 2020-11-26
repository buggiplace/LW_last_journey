class PlaylistsController < ApplicationController
  before_action :find_playlist

  def show
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to playlist_path
    else
      render "/playlist/show"
    end
  end

  private

  def find_playlist
    @funeral = current_user.funeral
    @playlist = Playlist.find(params[:id])
    authorize @playlist
  end

  def playlist_params
    params.require(:playlist).permit(:spotify_url)
  end
end
