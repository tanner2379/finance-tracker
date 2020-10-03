class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    
    if current_user.save
      flash[:notice] = "Following #{friend.full_name}"
    else
      flash[:alert] = "There was something wrong with the tracking request"
    end

    redirect_to friends_list_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    full_name = "#{friendship.friend.first_name} #{friendship.friend.last_name}"
    friendship.destroy
    flash[:notice] = "Stopped following #{full_name}."
    redirect_to friends_list_path
  end
end
