require 'rails_helper'

RSpec.describe 'Following' do
  let(:following) { build(:following) }

  it 'should be valid' do
    assert following.valid?
  end

  it 'record not valid if followed nil' do
    following.followed = nil
    following.save
    expect(following).to_not be_valid
  end

  it 'record not valid if follower nil' do
    following.follower = nil
    following.save
    expect(following).to_not be_valid
  end

  it 'duplicated record are not allowed' do
    following.save
    duplicated_following = Following.new(followed: following.followed, follower: following.follower)
    expect(duplicated_following).to_not be_valid
  end
end
