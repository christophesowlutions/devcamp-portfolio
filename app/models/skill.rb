# == Schema Information
#
# Table name: skills
#
#  id               :integer          not null, primary key
#  title            :string
#  percent_utilized :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  badge            :text
#

class Skill < ApplicationRecord
  includes Placeholder
  validates_presence_of :title, :percent_utilized

    after_initialize :set_defaults

  def set_defaults
    self.badge ||= Placeholder.image_generator(height: '250', width: '250')
  end

end
