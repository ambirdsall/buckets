class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :player
      t.string     :nba_stats_id
      t.string     :game_date
      t.boolean    :playoffs
      t.boolean    :win
      t.integer    :pts
      t.integer    :fga
      t.integer    :fgm
      t.float      :fg_pct
      t.integer    :min
      t.integer    :fg3a
      t.integer    :fg3m
      t.float      :fg3_pct
      t.integer    :fta
      t.integer    :ftm
      t.float      :ft_pct
      t.integer    :oreb
      t.integer    :dreb
      t.integer    :reb
      t.integer    :ast
      t.integer    :stl
      t.integer    :blk
      t.integer    :tov
      t.integer    :pf
      t.integer    :plus_minus

      t.timestamps null: false
    end
  end
end
