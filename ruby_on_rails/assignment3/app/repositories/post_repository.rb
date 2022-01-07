class PostRepository
  class << self
    # get all posts
    def getAllPosts
      @posts = Post.all
    end

    # create post
    def createPost(post)
      @is_post_create = post.save
    end

    # select post using post id
    def getPostByID(id)
      @post = Post.find(id)
    end

    # delete post
    def destroyPost(post)
      post.destroy
    end

  end
end