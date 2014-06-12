require_relative '../exceptions/invalid_account_number'

class SimpleQualificationService
  DEFAULTS = ['111']

  def initialize(qualified_accounts = DEFAULTS)
    @qualified = qualified_accounts
  end

  def qualified?(account_number)
    validate!(account_number)

    # in a real world scenario, we could make an expensive call to an external service or a database here
    # since we use dependency injection in RewardsService, this service is easily replaceable
    # if we actually call an external service, we would check for "CUSTOMER_ELIGIBLE" or "CUSTOMER_INELIGIBLE" here:
    @qualified.include?(account_number)
  end

  # just some arbitrary validation
  # with an external service call, this would probably look very different :]
  def validate!(account_number)
    if account_number.length < 3
      raise InvalidAccountNumber.new(account_number)
    end
  end
end