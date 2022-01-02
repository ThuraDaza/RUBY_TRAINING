class PostsController < ApplicationController

  def index
    # retreive all data from db
    @members = Post.all
  end

  def show
    # store id to make operation specific row
    @member = Post.find(params[:id])
  end

  def new
    # initaite new member
    @member = Post.new
  end

  def create
    puts "test data = #{member_params}"
    @member = Post.new(member_params)

    # save new member's row in db
    if @member.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # store id to make operation specific row
    @member = Post.find(params[:id])
  end

  def update
    @member = Post.find(params[:id])

    # update member's data
    if @member.update(member_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # delete the specific member in db
  def destroy
    @member = Post.find(params[:id])
    @member.destroy

    redirect_to root_path
  end

  # retreive user's input data
  private 
    def member_params
      params.require(:post).permit(:user_name, :title, :description, :public_flag)
    end
end
