class FollowingsController < ApplicationController
  def create
    follow = current_user.followers.new(followed_id: params[:id])
    follow.save
    redirect_to request.referrer
  end

  def destroy
    current_user.followers.find_by(followed_id: params[:friend]).destroy
    redirect_to request.referrer
  end
end
