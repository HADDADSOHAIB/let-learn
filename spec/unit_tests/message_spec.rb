
require 'rails_helper'

RSpec.describe 'Message' do
  before(:each) do
    @user = User.new(username: 'User',
                      fullname: 'User',
                      email: 'user@example.com',
                      password: 'password',
                      password_confirmation: 'password')
    @user.save
    @room = Room.create

    @message = Message.new(user: @user, room: @room, body: "test message")
    @message.save
  end

  it 'should be valid' do
    assert @message.valid?
  end

  it 'record not valid if user nil' do
    @message.user = nil
    @message.save
    expect(@message).to_not be_valid
  end

  it 'record not valid if room nil' do
    @message.room = nil
    @message.save
    expect(@message).to_not be_valid
  end
end