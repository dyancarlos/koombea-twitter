require "rails_helper"

RSpec.describe 'Tweets', type: :system do
  include AuthHelpers

  let(:user) { create(:user) }

  it 'creates a new tweet' do
    login(user)

    click_link 'Tweet'
    fill_in 'tweet_content', with: 'My tweet'
    click_button 'Post'

    expect(page).to have_text 'My tweet'
  end

  it 'sees the tweets from following users' do
    user2 = create(:user)
    user3 = create(:user)
    user4 = create(:user)
    create(:tweet, content: 'Content 1', user: user2)
    create(:tweet, content: 'Content 2', user: user3)
    create(:tweet, content: 'Content 3', user: user4)
    user.following << user2 << user3

    login(user)

    expect(page).to have_text 'Content 1'
    expect(page).to have_text 'Content 2'
    expect(page).to_not have_text 'Content 3'
  end
end