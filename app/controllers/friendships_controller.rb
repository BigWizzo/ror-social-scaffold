class FriendshipsController < ApplicationController

  def index
    @friendships = Friendship.all
  end

  def create
    @friendship = Friendship.create(friendship_params)
    if @friendship.save
      flash[:success] = 'Friendship created'
      redirect_to users_path
    else
      flash[:error] = 'Oops something went wrong'
      render 'new'
    end
  end

  def update
    @friendship = Friendship.find_by(friend_id: params[:friend_id], user_id: params[:user_id])
    @friendship.update(confirmed: true)
    redirect_to users_path, notice: 'Friendship accepted successfully'
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :confirmed)
  end
end
