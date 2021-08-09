# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:follow_id])
    current_user.follow(params[:follow_id]) unless current_user.following?(user)
    redirect_to users_path
  end

  def destroy
    Relationship.find(params[:id]).destroy
    redirect_to users_path
  end
end
