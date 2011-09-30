include ActionView::Helpers::NumberHelper

class Page < ActiveRecord::Base
  def self.get_for_index
    Page.order("date desc").all
  end

  def self.get_yesterday(today=nil)
    if today.nil? || today.date.nil?
      today_date = Date.today
    else
      today_date = today.date
    end
    Page.where(:date => today_date-1).first
  end

  def get_diff(key, yesterday)
    self[key] - yesterday[key]
  end

  def get_diff_text(key, yesterday)
    if self[key] && yesterday && yesterday[key]
      "(" + number_with_delimiter(get_diff(key, yesterday)) + ")"
    else
      ""
    end
  end
end
