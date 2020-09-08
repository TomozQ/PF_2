class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :summary
      t.string :director
      t.string :original
      t.string :acter
      t.string :image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
