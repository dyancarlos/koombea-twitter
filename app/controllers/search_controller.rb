class SearchController < ApplicationController
  def new
    @form = SearchForm.new
  end

  def create
    @form = SearchForm.new(current_user: current_user, username: search_params[:username])

    if @form.search
      redirect_to user_path(@form.user), alert: t('views.search.create.success')
    else
      redirect_to new_search_path, alert: t('views.search.create.failure')
    end
  end

  private

  def search_params
    params.require(:search_form).permit(:username)
  end
end