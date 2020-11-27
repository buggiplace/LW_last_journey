class AddProfileIdToPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :spotify_profile_url, :string
  end
end
