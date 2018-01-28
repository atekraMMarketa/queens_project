class ItemsController < ApplicationController

  def variants
    respond_to do |format|
      format.json do
        @variants = Variant.all
      end
    end
  end

  def destroy
    respond_to do |format|
      format.js do
        @item = Item.find params[:id]
        @document = @item.document
        @item.destroy
      end
    end
  end
end
