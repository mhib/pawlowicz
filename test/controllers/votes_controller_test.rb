require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  def setup
    @quote = quotes(:one)
  end
  test "should create" do
    assert_difference '@quote.votes.count' do
      xhr :post,  :create, pawlowicz_id: @quote.id, positive: true
    end
    assert_equal @quote.vote, 1
  end

  test "should update" do
    assert_difference 'Quote.first.vote', -2 do
      xhr :post,  :create, pawlowicz_id: Quote.first.id, positive: false
    end
  end
end
