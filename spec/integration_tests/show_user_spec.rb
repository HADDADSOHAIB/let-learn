require 'rails_helper'

RSpec.describe 'User can see the profil of other users', type: :feature do
  before(:each) do
    @user = User.new(username: 'ExampleUser',
                     fullname: 'Example User',
                     email: 'exampleuser@example.com',
                     password: 'password',
                     password_confirmation: 'password')
    @user.save
    @user_to_follow = User.new(username: 'UserToFollow',
                               fullname: 'User To Follow',
                               email: 'UserToFollow@example.com',
                               password: 'password',
                               password_confirmation: 'password')
    @user_to_follow.save
  end
  scenario 'acces profile' do
    visit new_user_session_path

    fill_in 'user[email]', with: 'exampleuser@example.com'
    fill_in 'user[password]', with: 'password'

    click_button 'Sign In'

    visit user_path(@user_to_follow)

    expect(page).to have_content('User To Follow')
  end
end
