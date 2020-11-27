class DigitalWillsController < ApplicationController
  before_action :find_digital_will

  def show
    @exclude_banner = false
    @banner_title = "Digital Will"
    @banner_url = "https://images.unsplash.com/photo-1544377193-33dcf4d68fb5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1778&q=80"
  end

  def update
    if @digital_will.update(digital_will_params)
      redirect_to digital_will_path
    else
      render "/digital_will/show"
    end
  end

private
  def find_digital_will
    @funeral = current_user.funeral
    @digital_will = DigitalWill.find(params[:id])
    authorize @digital_will
  end

  def digital_will_params
    params.require(:digital_will).permit(
      :cancel_accounts, :bank_account_1, :bank_account_2, :bank_account_3, :insurance_account_1, :insurance_account_2, :insurance_account_3, :hardware, :comment)
  end
end
