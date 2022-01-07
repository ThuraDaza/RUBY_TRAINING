class PostsController < ApplicationController

  def index
    # retreive all data from db
    @members = PostService.getAllPosts
    @member = Post.new
  end

  def create
    @member = Post.new(member_params)
    @is_post_create = PostService.createPost(@member)
    
    # save new member's row in db
    if @is_post_create

      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
        format.js   { render :layout => false, :template =>"posts/create.js.erb"}
      end

    else
      flash.now[:notice] = "Create failed......!"
    end
  end

  # delete the specific member in db
  def destroy
    @member = PostService.getPostByID(params[:id])
    PostService.destroyPost(@member)

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      format.js   { render :layout => false, :template => "posts/destroy.js.erb" }
    end

  end

  # retreive user's input data
  private 
    def member_params
      params.require(:post).permit(:user_name, :title, :description, :public_flag)
    end
end
