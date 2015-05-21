class Game < ActiveRecord::Base
  belongs_to :player

  def self.build_from_gamelog(gamelog, player_id)
    formatted_gamelog = Stats::GamelogTranslator.new(gamelog, player_id).translate
    new(filter_by_attributes(formatted_gamelog))
  end

  def self.filter_by_attributes(formatted_gamelog)
    formatted_gamelog.select {|statistic, _value| Game.attribute_method? statistic }
  end
end
