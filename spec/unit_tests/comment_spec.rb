require 'rails_helper'

RSpec.describe 'Comment' do
  let(:comment) { build(:comment) }

  it 'should be valid' do
    comment.save
    expect(comment).to be_valid
  end

  it 'comment is invalid if thought is nil' do
    comment.thought = nil
    comment.save
    expect(comment).to_not be_valid
  end

  it 'comment is invalid if user is nil' do
    comment.user = nil
    comment.save
    expect(comment).to_not be_valid
  end

  it 'comment is invalid if text is nil' do
    comment.text = nil
    comment.save
    expect(comment).to_not be_valid
  end

  it 'comment is invalid if text is linger then 250' do
    comment.text = 'a' * 251
    comment.save
    expect(comment).to_not be_valid
  end
end
