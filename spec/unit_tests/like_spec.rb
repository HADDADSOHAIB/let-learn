require 'rails_helper'

RSpec.describe 'Following' do
  let(:like) { build(:like) }
  it 'should be valid' do
    assert like.valid?
  end

  it 'like is invalid if thought is nil' do
    like.thought = nil
    like.save
    expect(like).to_not be_valid
  end

  it 'like is invalid if user is nil' do
    like.user = nil
    like.save
    expect(like).to_not be_valid
  end

  it 'duplicated record are not allowed' do
    like.save
    duplicated_like = Like.new(thought: like.thought, user: like.user)
    expect(duplicated_like).to_not be_valid
  end
end
