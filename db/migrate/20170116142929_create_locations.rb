class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.st_polygon :area, geographic: true, srid: 4326, null: false

      t.timestamps null: false
    end
  end
end
