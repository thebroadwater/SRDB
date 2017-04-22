class RenameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :people, :BLUF, :bluf
  end
end
