# == Schema Information
#
# Table name: variants
#
#  id         :integer          not null, primary key
#  name       :string
#  product_id :integer          indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Variant < ApplicationRecord
  has_many :items, :dependent => :destroy
  belongs_to :product, :optional => true

  validates_presence_of :name


  def full_name
    "#{product.name}, varianta: #{name}"
  end
end
