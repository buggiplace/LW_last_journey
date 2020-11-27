class PlaylistsController < ApplicationController
  before_action :find_playlist

  def show
    @exclude_banner = false
    @banner_title = "My Music"
    @embed_spotify_url = @playlist.spotify_url.match(/......................$/)
    @spotify_profile_url = @playlist.spotify_profile_url
    @banner_url = "https://images.unsplash.com/photo-1507838153414-b4b713384a76?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
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
