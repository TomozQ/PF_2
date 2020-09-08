class RenameActerColumnToMovie < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :acter, :actor
  end
end
