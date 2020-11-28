class FuneralTypesController < ApplicationController
  before_action :find_funeral_type

  def show

    @exclude_banner = false
    @banner_url = "https://images.unsplash.com/photo-1544813545-4827b64fcacb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
    @banner_title = "My Funeral"
    @locations = Location.all
    # the `geocoded` scope filters only locations with coordinates (latitude & longitude)
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { location: location }),
        image_url: helpers.asset_url('cloudy_marker_shine.png')
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
