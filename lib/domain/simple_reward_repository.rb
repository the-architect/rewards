class SimpleRewardRepository
  DEFAULTS = {
    'SPORTS' => 'CHAMPIONS_LEAGUE_FINAL_TICKET',
    'MUSIC'  => 'KARAOKE_PRO_MICROPHONE',
    'MOVIES' => 'PIRATES_OF_THE_CARIBBEAN_COLLECTION'
  }

  def initialize(reward_mapping = DEFAULTS)
    @reward_repository = reward_mapping
  end

  def rewards_for(channels = [])
    channels.uniq.map(&:upcase).map do |channel|
      @reward_repository[channel]
    end.compact
  end
end