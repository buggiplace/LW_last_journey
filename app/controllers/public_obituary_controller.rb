class PublicObituaryController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  before_action :find_obituary

  def show
    @exclude_banner = true
    @condolence = Condolence.new
    if @obituary.funeral.playlist.spotify_url != nil
      @embed_spotify_url = @obituary.funeral.playlist.spotify_url.match(/......................$/)
    end
  end

  def create_condolences
    @obituary = Obituary.find(params[:obituary_id])
    @condolence = @obituary.funeral.condolences.build(condolence_params)
    if @condolence.save
      @obituary.funeral.condolences
      # tried to build sorting below
      # @condolences = Condolence.order("created_at DESC").all
      redirect_to public_obituary_path(@obituary), notice: 'Condolence created!'
    else
      render 'show'
    end
  end

  private

  def condolence_params
    params.require(:condolence).permit(:first_name, :last_name, :content)
  end

  def find_obituary
    @obituary = Obituary.find(params[:obituary_id])

    @disable_nav = true

    @banner_url = "https://images.unsplash.com/photo-1544813545-4827b64fcacb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
    @banner_title = "Obituary of #{@obituary.funeral.user.first_name}"
  end
end
