class RelationshipsController < ApplicationController
  def create
    if Relationships::Create.new(current_user: current_user,
                             followed_id: params[:user_id]).call
      redirect_to user_path(params[:user_id]), notice: t('views.relationships.create.success')
    else
      redirect_to root_path
    end
  end
end