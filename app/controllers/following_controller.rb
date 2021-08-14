class FollowingController < ApplicationController
  before_action :fetch_user

  def index
    @users = @user
               .following
               .order(full_name: :asc)
               .paginate(page: params[:page])
               .decorate
  end
end
