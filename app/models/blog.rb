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
#  slug        :string
#  status      :integer          default(0)
#  topic_id    :integer
#

class Blog < ApplicationRecord
  validates_presence_of :title, :body

  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
end
