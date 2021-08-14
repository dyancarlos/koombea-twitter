require "rails_helper"

RSpec.describe 'Users', type: :system do
  include AuthHelpers

  let(:user) { create(:user) }

  it 'counts followers and following at home page' do
    user2 = create(:user)
    user3 = create(:user)
    user4 = create(:user)
    user5 = create(:user)
    user6 = create(:user)

    user.following << user2 << user3
    user.followers << user4 << user5 << user6

    login(user)

    within '.followers-count' do
      expect(page).to have_text 'Followers'
      expect(page).to have_text '3'
    end

    within '.following-count' do
      expect(page).to have_text 'Following'
      expect(page).to have_text '2'
    end
  end

  it 'follows a user that is already following me' do
    user2 = create(:user)
    user.followers << user2

    login(user)

    within '.followers-count' do
      expect(page).to have_text 'Followers'
      expect(page).to have_text '1'
    end

    within '.following-count' do
      expect(page).to have_text 'Following'
      expect(page).to have_text '0'
    end

    click_link '1'

    expect(page).to have_text user2.username
    click_link 'Follow'

    click_link 'Home'

    within '.followers-count' do
      expect(page).to have_text 'Followers'
      expect(page).to have_text '1'
    end

    within '.following-count' do
      expect(page).to have_text 'Following'
      expect(page).to have_text '1'
    end
  end

  it 'follows a user from their page' do
    user2 = create(:user)

    login(user)

    visit "/#{user2.username}"

    click_link 'Follow'
    click_link 'Home'

    within '.following-count' do
      expect(page).to have_text 'Following'
      expect(page).to have_text '1'
    end
  end

  it 'navigates in the followers list' do
    user2 = create(:user)
    user3 = create(:user)
    user4 = create(:user)
    user5 = create(:user)
    user6 = create(:user)

    user.followers << user2 << user3
    user3.followers << user4 << user5

    login(user)

    within '.followers-count' do
      click_link '2'
    end

    expect(page).to have_text user2.username
    expect(page).to have_text user3.username

    click_link "#{user3.full_name} (@#{user3.username})"

    within '.followers-count' do
      click_link '2'
    end

    expect(page).to have_text user4.username
    expect(page).to have_text user5.username
  end
end