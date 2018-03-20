class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def index
       @comments = Comment.where(post_id: @post) 
    end 
    
    def new
       @comment = Comment.new(post_id: params[:post_id])
    end    
    
       
    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.create(params[:comment].permit(:content))
        @comment.user_id = current_user.id
        @comment.post_id = @post.id
        
        if @comment.save
            redirect_to explore_path
        else
            render 'new'
        end    
    end
end
