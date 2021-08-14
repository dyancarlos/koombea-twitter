class UsersController < ApplicationController
  before_action :fetch_user

  def show
    @following_count = @user.following.count
    @followers_count = @user.followers.count
    @tweets = @user
                .tweets
                .order(created_at: :desc)
                .paginate(page: params[:page])
                .decorate
  end
end
