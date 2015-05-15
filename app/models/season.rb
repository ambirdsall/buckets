class Season < ActiveRecord::Base
  has_many :games
  belongs_to :player
end
