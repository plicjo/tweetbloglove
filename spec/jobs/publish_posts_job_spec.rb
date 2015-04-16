require 'rails_helper'

RSpec.describe PublishPostsJob, type: :job do
  let(:unpublished_post) { create :post_with_author }

  it "publishes a post" do
    allow_any_instance_of(Twitter::REST::Client).to receive(:update).and_return(twitter_status_update_response)
    PublishPostsJob.perform_now(unpublished_post.id)
    expect(unpublished_post.reload.published).to eq true
  end
end
