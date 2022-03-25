class PostService
  class << self
    # select all posts
    def get_all_posts
      @users = PostRepository.get_all_posts
    end

    # create post
    def create_post(post)
      @is_post_create = PostRepository.create_post(post)
    end

    # select post using post id
    def get_post_by_id(id)
      @user = PostRepository.get_post_by_id(id)
    end

    # delete post
    def destroy_post(post)
      PostRepository.destroy_post(post)
    end

  end
end