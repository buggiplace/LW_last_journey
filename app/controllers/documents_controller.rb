class DocumentsController < ApplicationController
  before_action :find_funeral
  skip_after_action :verify_policy_scoped

  def index
    authorize @funeral, :index_documents?
    @exclude_banner = true
    @banner_title = "My Documents"
    @banner_url = "https://images.unsplash.com/photo-1562240020-ce31ccb0fa7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"
  end

  def create
    authorize @funeral, :create_documents?
    if params && params[:funeral] && params[:funeral][:documents]
      @funeral.documents.attach(params[:funeral][:documents])
    end
    redirect_to funeral_documents_path(@funeral), notice: 'Document uploaded!'    
  end

  def destroy
    authorize @funeral, :destroy_documents?
    document = @funeral.documents.find(params[:id])
    document.destroy
    redirect_to funeral_documents_path(@funeral), notice: 'Document deleted!'
  end

  private

  def find_funeral
    @funeral = Funeral.find(params[:funeral_id])
  end
end
