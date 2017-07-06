# == Schema Information
#
# Table name: technologies
#
#  id           :integer          not null, primary key
#  name         :string
#  portfolio_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Technology < ApplicationRecord
  belongs_to :portfolio
end
