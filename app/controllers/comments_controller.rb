# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end