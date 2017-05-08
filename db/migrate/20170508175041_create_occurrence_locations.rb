class CreateOccurrenceLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :occurrence_locations do |t|
      t.references :occurrence, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
