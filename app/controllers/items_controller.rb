class ItemsController < ApplicationController

  def variants
    respond_to do |format|
      format.json do
        @variants = Variant.all
      end
    end
  end
end