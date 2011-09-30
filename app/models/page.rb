class Page < ActiveRecord::Base
  def self.get_for_index
    Page.order("date desc").all
  end

  def self.get_yesterday(today)
    Page.where(:date => today.date-1).first
  end
end
