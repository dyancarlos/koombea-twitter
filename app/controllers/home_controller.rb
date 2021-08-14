class HomeController < ApplicationController
  def index
    @following_count = current_user.following.count
    @followers_count = current_user.followers.count
    @tweets = current_user
                .feed
                .order(created_at: :desc)
                .paginate(page: params[:page])
                .decorate
  end
end
