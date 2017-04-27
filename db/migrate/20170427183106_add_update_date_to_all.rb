class AddUpdateDateToAll < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :updated_at, :datetime
    add_column :groups, :updated_at, :datetime
    add_column :locations, :updated_at, :datetime
    add_column :events, :updated_at, :datetime
    add_column :occurrences, :updated_at, :datetime
    add_column :sources, :updated_at, :datetime
  end
end
