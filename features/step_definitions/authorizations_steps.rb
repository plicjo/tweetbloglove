Given(/^an author has created a post and published it$/) do
  allow_any_instance_of(Twitter::REST::Client).to receive(:update).and_return(twitter_status_update_response)
  @author = Author.create(:provider => "twitter", :uid => "123456")
  @post   = build(:post)
  @post.author_id = @author.id
  @post.published = true
  @post.save!
end

Given(/^another author "(.*?)" is logged in$/) do |arg1|
  OmniAuth.config.mock_auth[:twitter] = twitter_auth_hash_for_another_author
  allow_any_instance_of(Twitter::REST::Client).to receive(:update).and_return(twitter_status_update_response)
  visit root_path
  click_on 'Sign In'
end

When(/^he tries to edit the post anyway$/) do
  visit edit_post_path(@post)
end

Then(/^the other author "(.*?)" should not see links to edit the original authors post$/) do |arg1|
  page.should have_content 'View'
  page.should_not have_content 'Delete'
end