class UserController < ApplicationController

  def follow
    follow = Follow.new(follow_params)
    if follow.save
      render json: follow
    else
      render json: {errors: follow.errors}
    end
  end

  def unfollow
    follow = Follow.find_by(follow_params)
    if follow.destroy
      render json: follow
    else
      render json: {errors: ['Not permitted']}
    end
  end

  private

  def follow_params
    params.require(:follow).permit(:following_id, :follower_id)
  end
end
