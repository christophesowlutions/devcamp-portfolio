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
#  position    :integer
#

class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,  # Makes destroying a technology possible
                                reject_if: lambda { |attrs| attrs['name'].blank? } # Makes it impossible to add an empty "name" field
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  #mount_uploader :thumb_image, PortfolioUploader
  #mount_uploader :main_image, PortfolioUploader


  def self.by_position
    order("position ASC")
  end

  scope :ruby_on_rails_portfolio_iems, -> { where(subtitle: 'Ruby on Rails') }
end