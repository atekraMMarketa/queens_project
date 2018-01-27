# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  variant_id  :integer          indexed
#  document_id :integer          indexed
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ApplicationRecord
  belongs_to :document
  belongs_to :variant


  validates_presence_of :variant_id, :document_id
end
