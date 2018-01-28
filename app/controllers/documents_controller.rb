class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def show
    @document = Document.find params[:id]
  end

  def new
    respond_to do |format|
      format.js do
        @document = Document.new
      end
    end
  end

  def create
    @document = Document.new permitted_params
    if @document.save
      variant_ids = (params[:variants_tokens] || []).map(&:to_i)

      variant_ids.each do |variant_id|
        @document.items.create! :variant_id => variant_id
      end

      redirect_to document_path(@document), :notice => "Dokument byl úspěšně přidán"
    else
      redirect_to :back, :flash => { :error => (@document.errors.full_messages.join("\n") unless @document.persisted?) }
    end
  end

  def destroy
    respond_to do |format|
      format.js do
        @document = Document.find params[:id]
        @document.destroy
        @documents = Document.all
      end
    end
  end

  private
  def permitted_params
    params.require(:document).permit( :name )
  end
end


