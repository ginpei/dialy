require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "get_for_index" do
    pages = Page.get_for_index
    assert_equal 2, pages[0].id
    assert_equal 1, pages[1].id
  end

  test "get_yesterday" do
    yesterday = Page.get_yesterday pages(:two)
    assert_equal 1, yesterday.id
  end

  test "get_diff" do
    assert_equal -1200, pages(:two).get_diff(:cash, pages(:one))
    assert_equal -400, pages(:two).get_diff(:suica, pages(:one))
  end

  test "get_diff_text" do
    assert_equal "(-1,200)", pages(:two).get_diff_text(:cash, pages(:one))
    assert_equal "(+300)", pages(:three).get_diff_text(:cash, pages(:two))
    assert_equal "(0)", pages(:three).get_diff_text(:suica, pages(:two))
    assert_equal "", pages(:three).get_diff_text(:suica, nil)
  end
end
