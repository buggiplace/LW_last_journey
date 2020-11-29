class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :blog ]

  def home
    @disable_nav = true
    @exclude_banner = true
  end

  def blog
    @disable_nav = true
    @exclude_banner = true
  end
end
