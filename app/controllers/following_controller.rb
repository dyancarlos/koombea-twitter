class FollowingController < ApplicationController
  def index
    @users = current_user
               .following
               .order(full_name: :asc)
               .paginate(page: params[:page])
               .decorate
  end
end