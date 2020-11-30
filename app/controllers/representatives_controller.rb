class RepresentativesController < ApplicationController
  before_action :find_funeral
  # skip_before_action :verify_policy_scoped, only: :show

  def show
    @exclude_banner = true
  end

  def update
  end

  # private

  def find_funeral
    @funeral = current_user.funeral_as_representative
    # maybe use params id...just an idea
  end

end
