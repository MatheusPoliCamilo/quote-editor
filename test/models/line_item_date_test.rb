require "test_helper"

class LineItemDateTest < ActiveSupport::TestCase
  test "#previous_date returns the quote's previous date when it exitsts" do
    assert_equal line_item_dates(:today), line_item_dates(:next_week).previous_date
  end

  test "#previous_date returns nil when the quote has no previous date" do
    assert_nil line_item_dates(:today).previous_date
  end
end
