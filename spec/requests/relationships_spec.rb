require 'rails_helper'

RSpec.describe RelationshipsController, type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe '#create' do
    let(:user2) { create(:user) }

    context 'when valid' do
      it 'starts following a user' do
        post follow_path(user2.id)

        expect(user.reload.following).to include(user2)
      end

      it 'redirects to user page' do
        post follow_path(user2.id)

        expect(response).to redirect_to(user_path(user2.id))
      end
    end

    context 'when invalid' do
      it 'redirects to home' do
        post follow_path(999999)

        expect(response).to redirect_to(root_path)
      end
    end
  end
end
