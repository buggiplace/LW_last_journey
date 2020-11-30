class PublicObituaryController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def show
    @condolence = Condolence.new
    @disable_nav = true
    @obituary = Obituary.find(params[:obituary_id])
    @banner_url = "https://images.unsplash.com/photo-1544813545-4827b64fcacb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
    @banner_title = "#{@obituary.funeral.user.first_name}'s Obituary"
     
  end  
  
  def create_condolences

  end  
end
