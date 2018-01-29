module ApplicationHelper
#unnecessary
#  def variants_for_select
#    Variant.order('name ASC').map  { |v| ["#{v.product.name}, varianta: #{v.name}", v.id] }
#  end


  def picture_url(object, type)

    if object.try(:picture).try(:exists?, type)
      object.picture.url(type)
    else
      path_to_image("#{type}/missing.png")
    end
  end
end
