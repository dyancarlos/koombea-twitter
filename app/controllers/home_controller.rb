class HomeController < ApplicationController
  def index
    @following_count = current_user.following.count
    @followers_count = current_user.followers.count
  end
end
