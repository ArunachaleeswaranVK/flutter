class PostsController < ApplicationController
       
    def new
       @post = Post.new 
    end
    
    def create
       @post = Post.new(post_params)
       @post.user_id = current_user.id
       
        if @post.save
           redirect_to root_path , notice: "Tweeted !"
        else
           render "new"
        end    
    end
    
    def upvote 
      @post = Post.find(params[:id])
      @post.upvote_by current_user
      redirect_to :back
    end  

    def downvote
      @post = Post.find(params[:id])
      @post.downvote_by current_user
      redirect_to :back
    end
    
    private
    
    def post_params
       params.require(:post).permit(:user_id,:content) 
    end    
    
    
    
    
end    