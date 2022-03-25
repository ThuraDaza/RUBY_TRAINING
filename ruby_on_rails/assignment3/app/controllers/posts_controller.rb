class PostsController < ApplicationController

  def index
    # retreive all data from db
    @members = PostService.get_all_posts
    @member = Post.new
  end

  def create
    @member = Post.new(member_params)
    @is_post_create = PostService.create_post(@member)
    
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
    @member = PostService.get_post_by_id(params[:id])
    PostService.destroy_post(@member)

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
