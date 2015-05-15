class Player < ActiveRecord::Base
  has_many :seasons
  has_many :games, :through => :seasons
end
