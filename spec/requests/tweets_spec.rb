require 'rails_helper'

RSpec.describe TweetsController, type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe '#create' do
    context 'when valid' do
      subject { post tweets_path, params: { tweet: { content: 'My tweet' } } }

      it 'creates a new tweet with correct information' do
        subject

        tweet = Tweet.last
        expect(tweet.content).to eq 'My tweet'
        expect(tweet.user).to eq user
      end

      it 'redirects to correct path after creation' do
        expect(subject).to redirect_to(root_path)
      end
    end

    context 'when invalid' do
      it 'does not create a new tweet with empty content' do
        post tweets_path, params: { tweet: { content: '' } }

        expect(response).to render_template(:new)
      end

      it 'does not create a new tweet with empty content' do
        post tweets_path, params: { tweet: { content: 'a' * 281 } }

        expect(response).to render_template(:new)
      end
    end
  end
end
