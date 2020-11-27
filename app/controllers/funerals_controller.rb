class FuneralsController < ApplicationController
  before_action :find_funeral

  # def create
  #   @funeral.user = current_user
  #   @funeral.preferences = {}
  #   @funeral.save!
  # end

  def dashboard

  end


  # def documents
  #   # @funeral = current_user.funeral
  # end

  # def update_documents
  #   # @funeral.preferences[:documents][:doc_comment] = params[:comment_doc].to_json[1..-2]
  #   # @funeral.preferences[:documents][:doc_comment] = params[:comment_doc].to_json[1..-2]
  #   # @funeral.preferences[:documents][:doc_comment] = params[:comment_doc].to_json[1..-2]
  #   # @funeral.save
  #   # redirect_to documents_path
  # end

  def guestlist
    # @funeral = current_user.funeral
    @guestlist = @funeral.guestlist
  end

  def update_guestlist
    @funeral.update(funeral_params)
    if @funeral.save
      redirect_to guestlist_path
    else
      render 'guestlist'
    end
  end

  private

  def find_funeral
    @funeral = current_user.funeral
  end


  def funeral_params
    params.require(:funeral).permit(guestlist: [])
  end

end


# def update
#     if @playlist.update(playlist_params)
#       redirect_to playlist_path
#     else
#       render "/playlist/show"
#     end
#   end

#   private

#   def find_playlist
#     @funeral = current_user.funeral
#     @playlist = Playlist.find(params[:id])
#   end

# end
