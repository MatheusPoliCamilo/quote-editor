require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "name" do
    assert_equal "Accountant", users(:accountant).name
  end
end
