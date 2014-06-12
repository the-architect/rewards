require_relative '../spec_helper'
require_relative '../../lib/domain/simple_reward_repository'

describe SimpleRewardRepository do
  it 'handles empty channel list' do
    expect(subject.rewards_for).to eql []
    expect(subject.rewards_for([])).to eql []
  end

  it 'handles unknown channels' do
    expect(subject.rewards_for(['ZOO', 'FOOD'])).to eql []
  end

  it 'returns rewards for known channels' do
    expect(subject.rewards_for(['SPORTS', 'FOOD', 'MUSIC'])).to eql [SimpleRewardRepository::DEFAULTS['SPORTS'], SimpleRewardRepository::DEFAULTS['MUSIC']]
  end
end