class FollowersController < ApplicationController
  def index
    @users = current_user
               .followers
               .order(full_name: :asc)
               .paginate(page: params[:page])
               .decorate
  end
end