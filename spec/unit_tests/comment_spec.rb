require 'rails_helper'

RSpec.describe 'Comment' do
  before(:each) do
    @user = User.new(username: 'User',
                      fullname: 'User',
                      email: 'user@example.com',
                      password: 'password',
                      password_confirmation: 'password')
    @user.save
    @thought = Thought.new(author: @user, text: "this a test thought")
    @thought.save

    @comment = Comment.new(thought: @thought, user: @user, text: "test comment")
    @comment.save
  end

  it 'should be valid' do
    assert @comment.valid?
  end

  it 'comment is invalid if thought is nil' do
    @comment.thought = nil
    @comment.save
    expect(@comment).to_not be_valid
  end

  it 'comment is invalid if user is nil' do
    @comment.user = nil
    @comment.save
    expect(@comment).to_not be_valid
  end

  it 'comment is invalid if text is nil' do
    @comment.text = nil
    @comment.save
    expect(@comment).to_not be_valid
  end

  it 'comment is invalid if text is linger then 250' do
    @comment.text = "a" * 251
    @comment.save
    expect(@comment).to_not be_valid
  end
end