class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.date :start
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
