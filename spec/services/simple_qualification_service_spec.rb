require_relative '../spec_helper'
require_relative '../../lib/services/simple_qualification_service'

describe SimpleQualificationService do

  let(:qualified_account_number){ '111' }
  let(:unqualified_account_number){ '999' }
  let(:invalid_account_number){ '4'}

  it 'account is qualified for rewards' do
    expect(subject.qualified?(qualified_account_number)).to be true
  end

  it 'account is unqualified for rewards' do
    expect(subject.qualified?(unqualified_account_number)).to be false
  end

  it 'invalid account number raises exception' do
    expect{ subject.qualified?(invalid_account_number) }.to raise_error(InvalidAccountNumber, "This Account Number is invalid: #{invalid_account_number}")
  end


end