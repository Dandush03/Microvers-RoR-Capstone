class CulturesController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @tweets = Culture.all
    @index = people_to_fallow
    commun_operation
  end

  def show
    @user = User.find(params[:id])
    follower_list = @user.followeds.select(:follower_id).limit(3)
    @followed_by ||= User.all.where(id: follower_list)
    @partial_name ||= params[:partial]
    commun_operation
  end

  def create
    user = current_user.cultures.new(form_parms)
    user.save
    redirect_to request.referrer
  end

  private

  def sub_menu(id = nil)
    case id
    when nil then 'tweets'
    else 'user_list'
    end
  end

  def form_parms
    params.require(:culture).permit(:text)
  end

  def people_to_fallow
    follower_list = @user.followers.select(:followed_id)
    User.all.order(:created_at).reverse_order.includes([:profile_img_attachment]).where.not(id: follower_list)
  end

  def commun_operation
    @partial ||= sub_menu(params[:menu])
    @culture = Culture.new
  end
end
