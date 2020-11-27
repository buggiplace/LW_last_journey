class DocumentsController < ApplicationController
  before_action :find_funeral

  def index
    @document = Document.new
    @documents = policy_scope(@funeral.documents)
    @exclude_banner = false
    @banner_title = "My Documents"
  end

  def create
    @document = @funeral.documents.build(document_params)
    @document.file_name = params[:document][:file].original_filename
    authorize @document
    if @document.save
      redirect_to funeral_documents_path(@funeral), notice: 'Document uploaded!'
    else
      render 'index'
    end
  end

  def destroy
    document = @funeral.documents.find(params[:id])
    authorize document
    document.destroy
    redirect_to funeral_documents_path(@funeral), notice: 'Document deleted!'
  end

  private

  def document_params
    params.require(:document).permit(:file)
  end

  def find_funeral
    @funeral = Funeral.find(params[:funeral_id])
  end
end
