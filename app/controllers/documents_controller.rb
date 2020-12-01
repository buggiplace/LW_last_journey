class DocumentsController < ApplicationController
  before_action :find_funeral

  def index
    @document = Document.new
    @documents = policy_scope(@funeral.documents)
    @exclude_banner = true
    @banner_title = "My Documents"
    @banner_url = "https://images.unsplash.com/photo-1562240020-ce31ccb0fa7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"
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
