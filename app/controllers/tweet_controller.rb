class TweetController < ApplicationController
  def index
    tweets = current_user.tweets
    render json: tweets
  end

  def create
    tweet = current_user.tweets.new(tweet_params)
    if tweet.save
      render json: tweet
    else
      render json: {errors: follow.errors}
    end
  end

  def destroy
    tweet = current_user.tweets.find_by(id: params[:id])
    if tweet.destroy
      render json: tweet
    else
      render json: {errors: ['Not permitted']}
    end
  end

  def show
    tweet = current_user.tweets.find_by(id: params[:id])
    render json: tweet
  end


  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
