class PostService
  class << self
    # select all posts
    def getAllPosts
      @users = PostRepository.getAllPosts
    end

    # create post
    def createPost(post)
      @is_post_create = PostRepository.createPost(post)
    end

    # select post using post id
    def getPostByID(id)
      @user = PostRepository.getPostByID(id)
    end

    # delete post
    def destroyPost(post)
      PostRepository.destroyPost(post)
    end

  end
end