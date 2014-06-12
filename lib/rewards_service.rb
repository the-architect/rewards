require_relative '../lib/exceptions/invalid_account_number'
require_relative '../lib/domain/simple_reward_repository'
require_relative '../lib/services/simple_qualification_service'

class RewardsService

  # We'll use some dependency injection to make our service's behaviour more flexible
  # this comes in handy if we want to swap out service back ends
  def initialize(account_number, subscriptions, reward_repository = SimpleRewardRepository.new, qualification = SimpleQualificationService.new)
    @account_number = account_number
    @subscriptions  = subscriptions

    @reward_repository = reward_repository
    @qualification_service = qualification

    @errors = []
  end

  def result
    Hash.new.tap do |result|
      result[:rewards] = rewards

      if @errors.any?
        result[:errors] = @errors
      end
    end
  end

  private

  # gather rewards based on subscriptions
  def rewards
    if @subscriptions.any? && account_qualified?
      @reward_repository.rewards_for(@subscriptions)
    else
      []
    end
  end

  # ask qualification service if this account is qualified for rewards
  def account_qualified?
    begin
      @qualification_service.qualified?(@account_number)
    rescue => e
      @errors << { e.class.name => e.message }
      false
    end
  end

end