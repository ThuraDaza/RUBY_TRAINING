class PostRepository
  class << self
    # get all posts
    def get_all_posts
      @posts = Post.all
    end

    # create post
    def create_post(post)
      @is_post_create = post.save
    end

    # select post using post id
    def get_post_by_id(id)
      @post = Post.find(id)
    end

    # delete post
    def destroy_post(post)
      post.destroy
    end

  end
end