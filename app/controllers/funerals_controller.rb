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

  # def representative
  # end

  # def update_representative
  # end

  # def music
  # end

  # def update_music
  # end

  # def digital_will
  # end

  # def update_digital_will
  # end

  # def obituary
  # end

  # def update_obituary
  # end

  # def guestlist
  # end

  # def update_guest_list
  # end

  # def funeral_type
  # end

  # def update_funeral_type
  # end

private

def find_funeral
  @funeral = current_user.funeral
  authorize @funeral
end


end
