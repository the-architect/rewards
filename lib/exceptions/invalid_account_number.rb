class InvalidAccountNumber < StandardError
  def initialize(account_number)
    @account_number = account_number
    super
  end

  def message
    "This Account Number is invalid: #{@account_number}"
  end
end