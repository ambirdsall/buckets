class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :player,       index: true, foreign_key: true
      t.string     :nba_stats_id, index: true
      t.string     :game_date
      t.boolean    :playoffs,     index: true
      t.boolean    :win,          index: true
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
