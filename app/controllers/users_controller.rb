# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :exist_user?, only: %i[show followings followers]
  before_action :set_user, only: %i[show followings followers]

  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @relationship = @user.followings.find_by(follower_id: current_user.id)
  end

  def followings
    @followings = @user.following_users
  end

  def followers
    @followers = @user.follower_users
  end

  private

  def exist_user?
    redirect_to users_path unless User.find_by(id: params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
