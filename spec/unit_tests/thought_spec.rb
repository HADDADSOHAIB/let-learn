require 'rails_helper'

RSpec.describe 'User' do
  before(:each) do
    @user = User.new(username: 'User1',
                      fullname: 'User1',
                      email: 'user1@example.com',
                      password: 'password',
                      password_confirmation: 'password')
    @user.save
    @thought = Thought.new(author: @user, text: "thought test")
    @thought.save
  end

  it 'should be valid' do
    assert @thought.valid?
  end


end