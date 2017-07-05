# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_name :string
#

class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
end
