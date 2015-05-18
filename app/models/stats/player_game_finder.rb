module Stats

  # Queries the nba.com/stats API for a list of all of given player's games.
  # Initialize with the player's nba.com ID (don't see a handy automated way
  # to do this yet) and specify regular season or playoffs. The response is
  # parsed into an array of game logs, where each game log is a Hash like the
  # following:
  #  {
  #   :season_id=>"42009",
  #   :player_id=>200765,
  #   :game_id=>"0040900204",
  #   :game_date=>"MAY 09, 2010",
  #   :matchup=>"BOS vs. CLE",
  #   :wl=>"W",
  #   :min=>47,
  #   :fgm=>9,
  #   :fga=>21,
  #   :oreb=>4,
  #   :dreb=>14,
  #   :reb=>18,
  #   :ast=>13,
  #   :stl=>2,
  #   :blk=>0,
  #   :tov=>4,
  #   :pf=>2,
  #   :pts=>29,
  #   :plus_minus=>14,
  #   :video_available=>0
  #  }.merge({
  #   :playoffs=>true
  #  })
  #
  class PlayerGameFinder < Stats::StatFinder

    REGULAR_SEASON = "Regular Season"
    PLAYOFFS       = "Playoffs"

    def initialize(player_id)
      @endpoint = "/playergamelog"
      @options  = {query: {
        "LeagueID" => "00",
        "PlayerID" => player_id,
        "Season" => "ALL"
      }}
    end

    def all_gamelogs
      all_regular_season_gamelogs + all_playoff_gamelogs
    end

    def all_regular_season_gamelogs
      all_games_of_type(playoffs: false)
    end

    def all_playoff_gamelogs
      all_games_of_type(playoffs: true)
    end

    protected

    def all_games_of_type(type_tag = {})
      raise "type_tag must have key :playoffs" unless type_tag.has_key? :playoffs

      type = (type_tag[:playoffs] ? PLAYOFFS : REGULAR_SEASON)

      extract_game_list(query(type)).map { |game| game.merge(type_tag) }
    end

    def extract_game_list(response)
      headers_and_rows = response["resultSets"].first

      hashify(zip(headers_and_rows))
    end

    def query(season_type)
      season_option = {query: {"SeasonType" => season_type}}
      get(@endpoint, @options.deep_merge(season_option)).parsed_response
    end

    def zip(headers_and_rows)
      headers_and_rows["rowSet"].map {|row| headers_and_rows["headers"].zip(row)}
    end

    def hashify(zipped_gamelogs)
      zipped_gamelogs.map do |gamelog|
        gamelog.map! {|stat| [stat.first.downcase.to_sym, stat.last]}
        Hash[gamelog]
      end
    end
  end
end
