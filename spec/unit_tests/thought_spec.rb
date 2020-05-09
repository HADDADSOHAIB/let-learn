require 'rails_helper'

RSpec.describe 'Thought' do
  let(:thought){ build(:thought) }
  it 'should be valid' do
    assert thought.valid?
  end

  it 'should not be valid if :author is nil' do
    thought.author = nil
    thought.save
    expect(thought).to_not be_valid
  end

  it 'should not be valid if :text is nil' do
    thought.text = nil
    thought.save
    expect(thought).to_not be_valid
  end

  it 'should not be valid if :text is more then 150 characters' do
    thought.text = 'a' * 251
    thought.save
    expect(thought).to_not be_valid
  end
end
