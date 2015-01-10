# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  quote_id   :integer
#  positive   :boolean          default("t")
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vote < ActiveRecord::Base
  after_save :update_quote

  belongs_to :quote

  validates :quote_id, presence: true
  validates :ip, presence: true

  scope :positive, -> { where(positive: true) }
  scope :negative, -> { where(positive: false) }

  private

  def update_quote
    quote.update_attribute(:vote, quote.votes.positive.size - quote.votes.negative.size)
  end
end
