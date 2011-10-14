require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "event array" do
    assert_equal pages(:one).events_array.size, 2
    assert_equal pages(:two).events_array.size, 0
  end
end
