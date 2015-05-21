module Stats
  # Takes a hash of stats comprising a player's boxscore from
  # stats.nba.com and reformats any fields that conflict with
  # the Game class' attributes.
  class GamelogTranslator
    def initialize(gamelog, player_id)
      @gamelog = gamelog
      @player_id = player_id
    end

    def translate
      game_stats = @gamelog.dup

      # NBA's :game_id becomes :nba_stats_id
      game_stats[:nba_stats_id] = @gamelog.delete :game_id
      # :player_id should refer to our ID, not NBA's
      game_stats[:player_id] = @player_id
      game_stats[:win] = (@gamelog[:wl] == "W")

      game_stats
    end
  end
end
