module FollowingHelper
  def followed?(id)
    current_user.followers.find_by(followed_id: id).nil?
  end

  def followers_counter(user)
    user.followeds.count
  end

  def followeds_counter(user)
    user.followers.count
  end
end
