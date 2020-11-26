class PlaylistsController < ApplicationController
  before_action :find_playlist

  def show
    @exclude_banner = false
    @banner_title = "My Playlist"
    @embed_spotify_url = @playlist.spotify_url.match(/......................$/)
    @spotify_profile_url = @playlist.spotify_profile_url
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
    params.require(:playlist).permit(:spotify_url, :embed_spotify_url, :spotify_profile_url)
  end
end

# spotify:playlist:3cG2t53DkOglpC4hzvu3bq
# <iframe src="https://open.spotify.com/embed/playlist/3cG2t53DkOglpC4hzvu3bq"

# ......................$

# <%= @playlist.spotify_url %>
