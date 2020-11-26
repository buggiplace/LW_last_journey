class DigitalWillsController < ApplicationController
  before_action :find_digital_will

  def show
    @exclude_banner = false
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
