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

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
