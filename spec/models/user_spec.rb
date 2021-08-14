require 'rails_helper'

RSpec.describe User, type: :model do
  it 'checks if user is following another user' do
    user1 = create(:user)
    user2 = create(:user)

    user1.following << user2
    expect(user1.following?(user2)).to be_truthy
  end
end
