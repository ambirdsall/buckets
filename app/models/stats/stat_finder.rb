module Stats
  class StatFinder
    include HTTParty
    base_uri 'stats.nba.com/stats'

    def get(endpoint, options = {})
      self.class.get(endpoint, options)
    end
  end
end
