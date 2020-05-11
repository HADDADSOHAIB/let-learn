require 'rails_helper'

RSpec.describe 'User' do
  let(:user) { build(:user) }

  it 'should be valid' do
    assert user.valid?
  end

  it 'should be not valid when :fullname is nil' do
    user.fullname = nil
    user.save
    expect(user).to_not be_valid
  end

  it 'should be not valid when :username is nil' do
    user.username = nil
    user.save
    expect(user).to_not be_valid
  end

  it 'should be not valid when :username is nil' do
    user.username = 'a' * 21
    user.save
    expect(user).to_not be_valid
  end

  it 'should be not valid when :username is duplicated' do
    user.save
    duplicate_user = user.dup
    expect(duplicate_user).to_not be_valid
  end

  it 'should be not valid when :email is nil' do
    user.email = nil
    user.save
    expect(user).to_not be_valid
  end

  it 'should be not valid when :email is duplicated' do
    user.save
    duplicate_user = user.dup
    expect(duplicate_user).to_not be_valid
  end

  it 'should be not valid when :password is nil' do
    user.password = nil
    user.save
    expect(user).to_not be_valid
  end
end
