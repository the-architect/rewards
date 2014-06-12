require_relative 'spec_helper'

require_relative '../lib/rewards_service'

describe RewardsService do
  subject{ RewardsService }

  let(:qualified_account_number){ SimpleQualificationService::DEFAULTS[0] }
  let(:unqualified_account_number){ '999' }
  let(:invalid_account_number){ '4' }

  let(:subscriptions){ ['SPORTS', 'KIDS'] }

  it 'takes in account number and channel subscriptions' do
    subject.new(qualified_account_number, subscriptions)
  end

  it 'returns the appropriate reward if customer is qualified' do
    service = subject.new(qualified_account_number, subscriptions)
    expect(service.result[:rewards]).to eq([SimpleRewardRepository::DEFAULTS['SPORTS']])
  end

  it 'returns no reward if customer is not qualified' do
    service = subject.new(unqualified_account_number, subscriptions)
    expect(service.result[:rewards]).to be_empty
  end

  it 'returns no rewards and adds error message if account number is invalid' do
    service = subject.new(invalid_account_number, subscriptions)
    result = service.result
    expect(result[:rewards]).to be_empty
    expect(result[:errors]).to eql [{ 'InvalidAccountNumber' => 'This Account Number is invalid: 4'}]
  end

end