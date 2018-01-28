class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def show
    @document = Document.find params[:id]
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new permitted_params
    if @document.save
      redirect_to document_path(@document), :notice => "Dokument byl úspěšně přidán"
    else
      redirect_to :back, :flash => { :error => (@document.errors.full_messages.join("\n") unless @document.persisted?) }
    end
  end

  def destroy
    @document = Document.find params[:id]
    @document.destroy
  end

  private
  def permitted_params
    params.require(:document).permit( :name, :variant_token => []  )
  end
end


