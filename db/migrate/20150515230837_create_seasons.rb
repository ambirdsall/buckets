class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.references :player
      t.integer    :year
      t.integer    :games_played
      t.integer    :games_total

      t.timestamps null: false
    end
  end
end
