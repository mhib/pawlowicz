require 'test_helper'

class PawlowiczsControllerTest < ActionController::TestCase

  def setup
    @quote = quotes(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: Quote.last
    assert_response :success
  end

  test "should update views count" do
    @q = Quote.last
    n = @q.views
    get :show, id: Quote.last
    assert_equal Quote.last.views, n + 1
  end

  test "should create quote when valid" do
    assert_difference 'Quote.count' do
      post :create, quote: { body: "a" * 14, author: "Marek" }
    end
    assert_redirected_to pawlowicz_path(Quote.last.id)
  end

  test "should not create quote when valid" do
    assert_no_difference 'Quote.count' do
      post :create, quote: { author: "Marek" }
    end
    assert_template :new
  end

  test "should redirect to random quote" do
    get :random
    assert_redirected_to %r{pawlowiczs\/\d+\z}
  end

end
