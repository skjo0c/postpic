class NaysController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post.downvote_from current_user
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

end
