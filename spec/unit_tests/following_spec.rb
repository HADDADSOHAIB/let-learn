require 'rails_helper'

RSpec.describe 'Following' do
  before(:each) do
    @user1 = User.new(username: 'User1',
                      fullname: 'User1',
                      email: 'user1@example.com',
                      password: 'password',
                      password_confirmation: 'password')
    @user1.save
    @user2 = User.new(username: 'User2',
                      fullname: 'User2',
                      email: 'user2@example.com',
                      password: 'password',
                      password_confirmation: 'password')
    @user2.save
    @following = Following.new(followed: @user1, follower: @user2)
    @following.save
  end

  it 'should be valid' do
    assert @following.valid?
  end

  it 'record not valid if followed nil' do
    @following.followed = nil
    @following.save
    expect(@following).to_not be_valid
  end

  it 'record not valid if follower nil' do
    @following.follower = nil
    @following.save
    expect(@following).to_not be_valid
  end

  it 'duplicated record are not allowed' do
    duplicated_following = Following.new(followed: @user1, follower: @user2)
    duplicated_following.save
    expect(duplicated_following).to_not be_valid
  end
end