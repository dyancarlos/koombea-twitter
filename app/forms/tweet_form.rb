class TweetForm
  include ActiveModel::Model

  attr_accessor :content, :user

  validates :content, presence: true, length: { maximum: 280 }
  validates :user, presence: true

  def create
    return unless valid?

    Tweet.create(content: content, user: user)
  end
end