# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  body       :text
#  author     :string
#  vote       :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  views      :integer          default("0")
#

class Quote < ActiveRecord::Base
  validates :body, presence: true,
    length: { in: 1..180 }
  validates :author, presence: true,
    length: { in: 1..50 }

  scope :random, -> { order 'RANDOM()' }

  has_many :votes

  def increase_views!
    update_attribute(:views, views + 1)
  end
end
