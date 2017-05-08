class CreateOccurrenceGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :occurrence_groups do |t|
      t.references :occurrence, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
