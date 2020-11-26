class FuneralTypesController < ApplicationController
  before_action :find_funeral_type

  def show
    if @funeral_type.geocoded?
      @marker = [{
        lat: @funeral_type.latitude,
        lng: @funeral_type.longitude,
      }]
    end
  end

  def update
    if @funeral_type.update(funeral_type_params)
      redirect_to funeral_type_path
    else
      render "/funeral_types/show"
    end
  end

private
  def find_funeral_type
    @funeral = current_user.funeral
    @funeral_type = FuneralType.find(params[:id])
  end

  def funeral_type_params
    params.require(:funeral_type).permit(
      :type, :comment, :loc_street, :loc_zip, :loc_city)
  end
end
