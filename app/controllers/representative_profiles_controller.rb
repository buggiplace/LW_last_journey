class RepresentativeProfilesController < ApplicationController
  before_action :find_representative_profile

  def show
    @exclude_banner = false
    @banner_title = "My Representative"
  end

  def update
    if @representative_profile.update(representative_profile_params)
      redirect_to representative_profile_path
    else
      render "/representative_profile/show"
    end
  end

  private

  def find_representative_profile
    @funeral = current_user.funeral
    @representative_profile = RepresentativeProfile.find(params[:id])
  end

  def representative_profile_params
    params.require(:representative_profile).permit(
      :first_name, :last_name, :comment, :email)
  end
end
