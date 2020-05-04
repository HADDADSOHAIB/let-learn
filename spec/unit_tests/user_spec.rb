require 'rails_helper'

RSpec.describe 'User' do
  before(:each) do
    @user = User.new(username: 'ExampleUser',
                      fullname: 'Example User',
                      email: 'user@example.com',
                      password: 'password',
                      password_confirmation: 'password')
    @user.save
  end

  it 'should be valid' do
    assert @user.valid?
  end

  it 'should be not valid when :fullname is nil' do
    @user.fullname = nil
    @user.save
    expect(@user).to_not be_valid
  end

  it 'should be not valid when :username is nil' do
    @user.username = nil
    @user.save
    expect(@user).to_not be_valid
  end

  it 'should be not valid when :username is nil' do
    @user.username = 'a' * 21
    @user.save
    expect(@user).to_not be_valid
  end

  it 'should be not valid when :username is duplicated' do
    duplicate_user = @user.dup
    duplicate_user.username = "exampleuser"
    expect(duplicate_user).to_not be_valid
  end

  it 'should be not valid when :email is nil' do
    @user.email = nil
    @user.save
    expect(@user).to_not be_valid
  end

  it 'should be not valid when :email is duplicated' do
    duplicate_user = @user.dup
    duplicate_user.email = "USer@example.com"
    expect(duplicate_user).to_not be_valid
  end

  it 'should be not valid when :password is nil' do
    @user.password = nil
    @user.save
    expect(@user).to_not be_valid
  end

  # it 'should be not valid when :fullname above max size 50 characters' do
  #   @user.name = 'names' * 20
  #   @user.save
  #   expect(@user).to_not be_valid
  # end

  # it 'should be not valid when :email is not format compliant' do
  #   @user.email = 'aba@'
  #   @user.save
  #   expect(@user).to_not be_valid
  # end

  # it 'email addresses should be unique' do
  #   duplicate_user = @user.dup
  #   duplicate_user.email = @user.email.upcase
  #   @user.save
  #   expect(duplicate_user).to_not be_valid
  # end

  # it 'should be not valid when :email is nil' do
  #   @user.email = nil
  #   @user.save
  #   expect(@user).to_not be_valid
  # end
end