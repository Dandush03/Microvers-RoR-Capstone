class CulturesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    follower_list = @user.followeds.select(:follower_id)
    @fallowed_by ||= User.all.where(id: follower_list)
  end

  def new; end

  def create; end

  def update; end

  def delete; end
end
