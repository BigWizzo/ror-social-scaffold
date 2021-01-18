module UserHelper
  def friendship_status(user)
    if user.pending_friends.include?(current_user) || current_user.pending_friends.include?(user)
      'Confirmation pending'
    elsif user.friend?(current_user) || current_user.friend?(user)
      'Already your Friend'
    elsif user != current_user
      link_to 'Add as Friend',
              friendships_path(friendship: { user_id: current_user,
                                             friend_id: user.id, confirmed: false }),
              method: :post
    end
  end
end
