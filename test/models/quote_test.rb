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

require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  test "should increase views" do
    @q = quotes(:one)
    c = @q.views
    @q.increase_views!
    assert_equal @q.views, c + 1
  end
end
