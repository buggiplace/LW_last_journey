class FuneralsController < ApplicationController

  def dashboard
    @funeral = current_user.funeral
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
