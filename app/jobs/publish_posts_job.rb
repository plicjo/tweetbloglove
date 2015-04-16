class PublishPostsJob < ActiveJob::Base
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    post.update(published: true)
  end
end
