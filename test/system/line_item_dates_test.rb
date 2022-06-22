require "application_system_test_case"

class LineItemSystemTest < ApplicationSystemTestCase
  # We must include this module to be able to use the
  # `number_to_currency` method in our test
  include ActionView::Helpers::NumberHelper

  setup do
    login_as users(:accountant)

    @quote          = quotes(:first)
    @line_item_date = line_item_dates(:today)
    @line_item      = line_items(:room_today)

    visit quote_path(@quote)
  end

  test "Creating a new line item" do
    assert_selector "h1", text: "First quote"

    within "##{dom_id(@line_item_date)}" do
      click_on "Add item", match: :first
    end
    assert_selector "h1", text: "First quote"

    fill_in "Name", with: "Animation"
    fill_in "Quantity", with: 1
    fill_in "Unit price", with: 1234
    click_on "Create item"

    assert_selector "h1", text: "First quote"
    assert_text "Animation"
    assert_text number_to_currency(1234)
    assert_text number_to_currency(@quote.total_price)
  end

  test "Updating a line item date" do
    assert_selector "h1", text: "First quote"
  
    within id: dom_id(@line_item_date, :edit) do
      click_on "Edit"
    end
  
    assert_selector "h1", text: "First quote"
  
    fill_in "Date", with: Date.current + 1.day
    click_on "Update date"
  
    assert_text I18n.l(Date.current + 1.day, format: :long)
    assert_text number_to_currency(@quote.total_price)
  end
  
  test "Destroying a line item date" do
    assert_text I18n.l(Date.current, format: :long)
  
    accept_confirm do
      within id: dom_id(@line_item_date, :edit) do
        click_on "Delete"
      end
    end
  
    assert_no_text I18n.l(Date.current, format: :long)
    assert_text number_to_currency(@quote.total_price)
  end
end
