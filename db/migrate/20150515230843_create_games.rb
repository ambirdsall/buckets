class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :season
      t.integer    :points
      t.integer    :field_goals_attempted
      t.integer    :field_goals_made
      t.integer    :threes_attempted
      t.integer    :threes_made
      t.integer    :offensive_rebounds
      t.integer    :defensive_rebounds
      t.integer    :free_throws_attempted
      t.integer    :free_throws_made
      t.integer    :assists
      t.integer    :steals
      t.integer    :blocks
      t.integer    :turnovers
      t.integer    :fouls
      t.integer    :plus_minus

      t.timestamps null: false
    end
  end
end


#SEASON_ID","Player_ID","Game_ID","GAME_DATE","MATCHUP","WL","MIN","FGM","FGA","FG_PCT","FG3M","FG3A","FG3_PCT","FTM","FTA","FT_PCT","OREB","DREB","REB","AST","STL","BLK","TOV","PF","PTS","PLUS_MINUS"
