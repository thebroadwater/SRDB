class CreateOccurrencePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :occurrence_people do |t|
      t.references :occurrence, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
