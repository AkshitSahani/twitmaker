class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if request.xhr?
      @tweet.save

      respond_to do |format|
        format.html do
          render html: "<li class='tweet'> <p> #{@tweet.message} </p> </li>".html_safe
        end
      end

    else
      if @tweet.save
        redirect_to tweets_path
      else
        render :index
      end
    end
  end

  def destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message)
  end
end
