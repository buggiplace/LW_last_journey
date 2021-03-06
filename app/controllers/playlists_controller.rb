class PlaylistsController < ApplicationController
  before_action :find_playlist

  def show
    @exclude_banner = true
    @banner_title = "My Music"
    @spotify_profile_url = @playlist.spotify_profile_url
    if @playlist.spotify_url != nil
      @embed_spotify_url = @playlist.spotify_url.match(/......................$/)
    end
    @banner_url = "https://images.unsplash.com/photo-1484755560615-a4c64e778a6c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=680&q=80"
  end

  def update
    if @playlist.update(playlist_params)
      if params[:redirect_to] == "Save & exit"
        redirect_to funerals_dashboard_path
      else
        redirect_to playlist_path
      end
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
