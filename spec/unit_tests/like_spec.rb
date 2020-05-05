require 'rails_helper'

RSpec.describe 'Following' do
  before(:each) do
    @user = User.new(username: 'User',
                      fullname: 'User',
                      email: 'user@example.com',
                      password: 'password',
                      password_confirmation: 'password')
    @user.save
    @thought = Thought.new(author: @user, text: "this a test thought")
    @thought.save

    @like = Like.new(thought: @thought, user: @user)
    @like.save
  end

  it 'should be valid' do
    assert @like.valid?
  end

  it 'like is invalid if thought is nil' do
    @like.thought = nil
    @like.save
    expect(@like).to_not be_valid
  end

  it 'like is invalid if user is nil' do
    @like.user = nil
    @like.save
    expect(@like).to_not be_valid
  end

  it 'duplicated record are not allowed' do
    duplicated_like = Like.new(thought: @thought, user: @user)
    duplicated_like.save
    expect(duplicated_like).to_not be_valid
  end
end