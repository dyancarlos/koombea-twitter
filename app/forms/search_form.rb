class SearchForm
  include ActiveModel::Model

  attr_accessor :current_user, :username, :user

  def search
    return false if user.blank? || current_user.following?(user)

    ::Relationships::Create.new(current_user: current_user,
                                followed_id: username).call
  end

  def user
    User.find_by(username: username)
  end
end