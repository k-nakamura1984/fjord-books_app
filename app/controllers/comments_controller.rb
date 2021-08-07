# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path, notice: t('controllers.common.notice_create', name: Comment.model_name.human))
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :report_id)
  end
end
