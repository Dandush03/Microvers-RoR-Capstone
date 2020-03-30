class CulturesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    follower_list = @user.followeds.select(:follower_id).limit(3)
    @followed_by ||= User.all.where(id: follower_list)
    @partial ||= sub_menu(params[:menu])
    @partial_name ||= params[:partial]
    @culture = Culture.new
  end

  def new; end

  def create
    current_user.cultures.create(form_parms)
    redirect_to request.referrer unless request.referrer.nil?
  end

  def update; end

  def delete; end

  private

  def sub_menu(id = nil)
    case id
    when nil then 'tweets'
    else 'user_list'
    end
  end
end

private
def form_parms
  params.require(:culture).permit(:text)
end
