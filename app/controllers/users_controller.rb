# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    # @users = User.order(:id).page(params[:page])
    @users = User.with_attached_icon.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
end
