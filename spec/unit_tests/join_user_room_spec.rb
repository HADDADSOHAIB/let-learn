require 'rails_helper'

RSpec.describe 'JoinUserRoom' do
  before(:each) do
    @user = User.new(username: 'User',
                      fullname: 'User',
                      email: 'user@example.com',
                      password: 'password',
                      password_confirmation: 'password')
    @user.save
    @room = Room.create

    @join_user_room = JoinUserRoom.new(user: @user, room: @room)
    @join_user_room.save
  end

  it 'should be valid' do
    assert @join_user_room.valid?
  end

  it 'record not valid if user nil' do
    @join_user_room.user = nil
    @join_user_room.save
    expect(@join_user_room).to_not be_valid
  end

  it 'record not valid if room nil' do
    @join_user_room.room = nil
    @join_user_room.save
    expect(@join_user_room).to_not be_valid
  end
  
  it 'duplicated record are not allowed' do
    duplicated_join = JoinUserRoom.new(user: @user, room: @room)
    duplicated_join.save
    expect(duplicated_join).to_not be_valid
  end
end