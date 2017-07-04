# == Schema Information
#
# Table name: portfolios
#
#  id          :integer          not null, primary key
#  title       :string
#  subitle     :string
#  body        :text
#  main_image  :text
#  thumb_image :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Portfolio < ApplicationRecord
end
