require 'rails_helper'

RSpec.describe 'Message' do
  let(:message) { build(:message) }

  it 'should be valid' do
    assert message.valid?
  end

  it 'record not valid if user nil' do
    message.user = nil
    message.save
    expect(message).to_not be_valid
  end

  it 'record not valid if room nil' do
    message.room = nil
    message.save
    expect(message).to_not be_valid
  end
end
