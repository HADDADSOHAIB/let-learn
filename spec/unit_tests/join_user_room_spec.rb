require 'rails_helper'

RSpec.describe 'JoinUserRoom' do
  let(:join_user_room) { build(:join_user_room) }
  it 'should be valid' do
    assert join_user_room.valid?
  end

  it 'record not valid if user nil' do
    join_user_room.user = nil
    join_user_room.save
    expect(join_user_room).to_not be_valid
  end

  it 'record not valid if room nil' do
    join_user_room.room = nil
    join_user_room.save
    expect(join_user_room).to_not be_valid
  end

  it 'duplicated record are not allowed' do
    join_user_room.save
    duplicated_join = JoinUserRoom.new(user: join_user_room.user, room: join_user_room.room)
    expect(duplicated_join).to_not be_valid
  end
end
