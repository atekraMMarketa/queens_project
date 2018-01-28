class VariantsController < ApplicationController

  def destroy
    respond_to do |format|
      format.js do
        @variant = Variant.find params[:id]
        @product = @variant.product
        @variant.destroy
      end
    end
  end
end