class FollowingController < ApplicationController
  def index
    @users = current_user
               .following
               .order(full_name: :asc)
               .paginate(page: params[:page], per_page: 10)
               .decorate
  end
end