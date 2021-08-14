require "rails_helper"

RSpec.describe 'Home', type: :system do
  include AuthHelpers

  let(:user) { create(:user) }

  it 'shows navigation link after logged in' do
    login(user)

    expect(page).to have_text "Logged as: #{user.username}"
    expect(page).to have_link 'Home'
    expect(page).to have_link 'Logout'
  end
end