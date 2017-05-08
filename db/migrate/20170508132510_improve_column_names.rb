class ImproveColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :sources, :title, :name
    rename_column :sources, :back_text, :details
    rename_column :people, :bluf, :summary
    rename_column :people, :description, :details
    rename_column :locations, :description, :details
    add_column :groups, :summary, :text
    add_column :groups, :details, :text
    add_column :locations, :summary, :text
  end
end
