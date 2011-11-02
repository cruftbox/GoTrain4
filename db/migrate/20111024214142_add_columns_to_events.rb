class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :info_url, :string
    add_column :events, :description, :text
    add_column :events, :start_time, :time
  end
end
