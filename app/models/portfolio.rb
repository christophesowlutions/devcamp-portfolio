# == Schema Information
#
# Table name: portfolios
#
#  id          :integer          not null, primary key
#  title       :string
#  subtitle    :string
#  body        :text
#  main_image  :text
#  thumb_image :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/350x200"
  end
end

