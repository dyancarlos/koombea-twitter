require 'rails_helper'

RSpec.describe SearchController, type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe '#create' do
    it 'follows the user if existent using the search' do
      user2 = create(:user)

      post search_index_path, params: { search_form: { username: user2.username } }

      expect(response).to redirect_to(user_path(user2))
      expect(user.reload.following).to include(user2)
    end
  end
end