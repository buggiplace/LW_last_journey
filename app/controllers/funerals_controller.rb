class FuneralsController < ApplicationController
  before_action :find_funeral

  def create
    @funeral.user = current_user
    @funeral.preferences = {}
    @funeral.save!
  end

  def dashboard
    if @funeral.nil?
    @funeral = Funeral.new
    end
  end

  def documents
    # @funeral = current_user.funeral
  end

  def update_documents
    @funeral.preferences[:documents][:doc_comment] = params[:comment_doc].to_json
  end

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
end


end
