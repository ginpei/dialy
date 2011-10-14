class AddEventsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :events, :text
  end
end
