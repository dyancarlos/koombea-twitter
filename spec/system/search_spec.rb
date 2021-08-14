require "rails_helper"

RSpec.describe 'Search', type: :system do
  include AuthHelpers

  let(:user) { create(:user) }

  it 'follows a user by the serach form' do
    user2 = create(:user)

    login(user)

    within '.following-count' do
      expect(page).to have_text 'Following'
      click_link '0'
    end

    click_link 'Follow another user'

    fill_in 'Username', with: user2.username
    click_button 'Follow user'

    expect(page).to have_text 'You started to follow a new user'
  end

  it 'shows error message when try to follow a already followed user' do
    user2 = create(:user)
    user.following << user2

    login(user)

    within '.following-count' do
      expect(page).to have_text 'Following'
      click_link '1'
    end

    click_link 'Follow another user'

    fill_in 'Username', with: user2.username
    click_button 'Follow user'

    expect(page).to have_text 'You are already following this user'
  end
end