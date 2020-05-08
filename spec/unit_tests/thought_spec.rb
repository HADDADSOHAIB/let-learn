require 'rails_helper'

RSpec.describe 'Thought' do
  before(:each) do
    @user = User.new(username: 'User1',
                     fullname: 'User1',
                     email: 'user1@example.com',
                     password: 'password',
                     password_confirmation: 'password')
    @user.save
    @thought = Thought.new(author: @user, text: 'thought test')
    @thought.save
  end

  it 'should be valid' do
    assert @thought.valid?
  end

  it 'should not be valid if :author is nil' do
    @thought.author = nil
    @thought.save
    expect(@thought).to_not be_valid
  end

  it 'should not be valid if :text is nil' do
    @thought.text = nil
    @thought.save
    expect(@thought).to_not be_valid
  end

  it 'should not be valid if :text is more then 150 characters' do
    @thought.text = 'a' * 251
    @thought.save
    expect(@thought).to_not be_valid
  end
end
