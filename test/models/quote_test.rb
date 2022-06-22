require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  test "#total_price returns the sum of the total price of all line items" do
    assert_equal 2500, quotes(:first).total_price
  end
end
