class CondolencesController < ApplicationController
  def destroy
    condolence = Condolence.find(params[:id])
    authorize condolence
    condolence.destroy
    redirect_to public_obituary_path(condolence.funeral.obituary), notice: 'Condolence deleted!'
  end
end
