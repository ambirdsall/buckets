class Player < ActiveRecord::Base
  has_many :games

  def fetch_unstored_games
    game_finder = Stats::PlayerGameFinder.new(nba_stats_id)

    game_finder.all_gamelogs.each do |gamelog|
      next if Game.find_by_nba_stats_id gamelog[:game_id]
      Game.build_from_gamelog(gamelog, id).save!
    end
  end
end
