class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name,     null: false, limit: 255
      t.st_polygon :area, null: false

      t.timestamps null: false
    end
  end
end
