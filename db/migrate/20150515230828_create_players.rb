class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :nba_stats_id

      t.timestamps null: false
    end
  end
end
