class PostsController < ApplicationController
	def create
  		@post = current_user.posts.create(post_params)
  		if @post.valid?
   		 redirect_to root_path
  		else
   		 render :new, status: :unprocessable_entity
  	end
end
	
private
	def post_params
	  params.require(:post).permit(:user_id, :photo, :description)
	end

	before_action :authenticate_user!, only: [:new, :create]
end