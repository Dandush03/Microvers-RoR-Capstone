class CulturesController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    follower_list = @user.followeds.select(:follower_id).limit(3)
    @followed_by ||= User.all.where(id: follower_list)
    @partial ||= sub_menu(params[:test])
  end

  def create; end

  def update; end

  def delete; end
  
  private

  def sub_menu(id = nil)
    case id
    when nil then 'user_list'
    when "1" then 'cover'
    else 'tesr'
    end
	end
end
