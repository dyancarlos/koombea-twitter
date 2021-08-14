class TweetsController < ApplicationController
  def create
    @tweet_form = TweetForm.new(tweet_params)

    if @tweet_form.create
      redirect_to root_path, notice: t('views.tweets.create.success')
    else
      render :new
    end
  end

  private

  def tweet_params
    params.require(:tweet)
          .permit(:content)
          .merge!(user: current_user)
  end
end
