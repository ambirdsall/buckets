require 'rails_helper'

RSpec.describe Game, type: :model do
  describe ".build_from_gamelog" do
    before :each do
      @fab = Player.create(name: "Fab Melo", nba_stats_id: "203097")
      @gamelog = {
        :season_id=>"22012",
        :player_id=>203097,
        :game_id=>"0021200686",
        :game_date=>"FEB 01, 2013",
        :matchup=>"BOS vs. ORL",
        :wl=>"W",
        :min=>3,
        :fgm=>0,
        :fga=>0,
        :fg_pct=>0.0,
        :fg3m=>0,
        :fg3a=>0,
        :fg3_pct=>0.0,
        :ftm=>0,
        :fta=>0,
        :ft_pct=>0.0,
        :oreb=>0,
        :dreb=>0,
        :reb=>0,
        :ast=>0,
        :stl=>1,
        :blk=>0,
        :tov=>0,
        :pf=>0,
        :pts=>0,
        :plus_minus=>-1,
        :video_available=>1,
        :playoffs=>false
      }
      @new_game = Game.build_from_gamelog(@gamelog, @fab.id)
    end

    it "returns a game instance" do
      expect(@new_game.class).to eq Game
    end

    it "doesn't persist the new game" do
      expect(@new_game.new_record?).to be true
    end

    it "converts :player_id to primary key" do
      expect(@new_game.player_id).to eq @fab.id
    end

    it "converts :wl to :win" do
      expect(@new_game.win).to be true
    end
  end
end
