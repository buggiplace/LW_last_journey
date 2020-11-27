class FuneralTypesController < ApplicationController
  before_action :find_funeral_type

  def show
    @locations = Location.all
    # the `geocoded` scope filters only locations with coordinates (latitude & longitude)
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { location: location })
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
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
    authorize @funeral_type
  end

  def funeral_type_params
    params.require(:funeral_type).permit(
      :burial_type, :comment, :loc_street, :loc_zip, :loc_city)
  end
end
