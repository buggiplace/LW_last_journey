class FuneralsController < ApplicationController

  def dashboard
    @funeral = current_user.funeral
  end

  def documents
    @funeral = current_user.funeral
  end

  def update_documents
  end

  def representative
  end

  def update_representative
  end

  def music
  end

  def update_music
  end

  def digital_will
  end

  def update_digital_will
  end

  def obituary
  end

  def update_obituary
  end

  def guestlist
  end

  def update_guest_list
  end

  def funeral_type
  end

  def update_funeral_type
  end


  # def funeral_type_show
  #   @funeral = Funeral.find(params[:id])
  # end

  # def funeral_type_edit
  #   @funeral = Funeral.find(params[:id])
  # end

  # def funeral_type_update
  #   @funeral = Funeral.find(params[:id])
  # end
end
