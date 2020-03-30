class FollowingsController < ApplicationController
  def create
    current_user.followers.create(followed_id: params[:id])
    redirect_to request.referrer unless request.referrer.nil?
  end

  def destroy
    current_user.followers.find_by(followed_id: params[:id]).destroy
    redirect_to request.referrer unless request.referrer.nil?
  end
end
