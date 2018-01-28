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
  has_many :items

  def variant_data
    tokens = known_languages.map do |known_language|
      { :id => known_language.language_code, :label => I18n.t("languages.#{known_language.language_code}") }
    end

    { :sts => tokens }
  end

  def language_token=(token_ids)
    languages = [token_ids].flatten.map do |token_id|
      token_id = token_id.to_s.strip
    end

    known_languages.destroy_all

    languages.each do |language|
      known_languages.create! :language_code => language
    end
  end

end
