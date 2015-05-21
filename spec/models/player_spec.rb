require 'rails_helper'

RSpec.describe Player, type: :model do
  before :each do
    @fab = Player.create(name: "Fab Melo", nba_stats_id: "203097")
  end
  describe "#fetch_unstored_games" do
    it "doesn't have any games before fetching" do
      expect(@fab.games.count).to eq(0)
    end

    it "adds all of a player's games" do
      @fab.fetch_unstored_games

      expect(@fab.games.count).to eq(6)
    end

    it "doesn't re-add existing games" do
      2.times { @fab.fetch_unstored_games }

      expect(@fab.games.count).to eq(6)
    end
  end
end
