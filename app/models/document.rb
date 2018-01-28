# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Document < ApplicationRecord
  has_many :items, :dependent => :destroy

  validates_presence_of :name
end
