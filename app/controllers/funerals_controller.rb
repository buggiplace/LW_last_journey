class FuneralsController < ApplicationController
  before_action :find_funeral

  # def create
  #   @funeral.user = current_user
  #   @funeral.preferences = {}
  #   @funeral.save!
  # end

  def dashboard
    @exclude_banner = false
    @banner_title = "Dashboard"
    @banner_url = "https://images.unsplash.com/photo-1498550744921-75f79806b8a7?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=b0f6908fa5e81286213c7211276e6b3d&auto=format&fit=crop&w=1500&q=80"
  end

  def new_rep
    authorize @funeral
    @representative = User.new
  end

  def create_rep
    authorize @funeral
    @representative = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
    @representative.password = "123456"
    @representative.kind = "representative"
    # call a new method that notifies the user here
    @funeral = Funeral.find(params[:funeral_id])
    if @representative.save
      @funeral.representative = @representative
      @funeral.save
      redirect_to funerals_dashboard_path, notice: 'Representative account was successfully created.'
    else
      # still need to display all of the errors in the view
      render :new_rep
    end
  end


# "authenticity_token"=>"Y6ydy4+laq4ASEEAe8rtNn76aE9msWOIyWhzDchf9Wewu7OIMMbw/nBuCXCnaN2GEOi5boCfpRhWyNAxBNHXCw==",
#  "first_name"=>"peter",
#  "last_name"=>"muster",
#  "email"=>"hello@hello.com",
#  "commit"=>"Save changes",
#  "funeral_id"=>"2"





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

  # def guestlist
  #   # @funeral = current_user.funeral
  #   @guestlist = @funeral.guestlist
  # end



  private

  def find_funeral
    @funeral = current_user.funeral
    authorize @funeral
  end


  # def user_params
  #   params.require(:user).permit(:firs_name, :last_name, :email)
  # end

end


# def update
#     if @playlist.update(playlist_params)
#       redirect_to playlist_path
#     else
#       render "/playlist/show"
#     end
#   end


#   def find_playlist
#     @funeral = current_user.funeral
#     @playlist = Playlist.find(params[:id])
#   end

# end
