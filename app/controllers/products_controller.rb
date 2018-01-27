class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new permitted_params
    if @product.save
      redirect_to product_path(@product), :notice => "Produkt byl úspěšně přidán"
    else
      redirect_to :back, :flash => { :error => (@product.errors.full_messages.join("\n") unless @product.persisted?) }
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
  end

  private
  def permitted_params
    params.require(:product).permit(:name, :description, :picture, :variants_attributes => [:id, :name]  )
  end
end


