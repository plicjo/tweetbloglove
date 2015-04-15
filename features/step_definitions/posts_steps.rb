Given(/^is on the new post page$/) do
  visit new_post_path
end

Given(/^a visitor is not signed in$/) do
  # Do nothing
end

Given(/^tries to visit the new post page$/) do
  visit new_post_path
end

Given(/^an author has created a post$/) do
  allow_any_instance_of(Twitter::REST::Client).to receive(:update).and_return(twitter_status_update_response)
  @author = Author.create(:provider => "twitter", :uid => "123456")
  @post   = build(:post)
  @post.author_id = @author.id
  @post.save!
end

When(/^the author submits a valid edit post form$/) do
  fill_in 'post_title', with: 'New Post Title'
  fill_in 'post_body',  with: Faker::Lorem.paragraph(2)
  click_button 'Update Post'
end

When(/^I write a post using Markdown$/) do
  fill_in 'post_title', with: 'Example Post'
  fill_in 'post_body',  with: '## This will be a h2'
end

When(/^I upload an image$/) do
  attach_file 'post_featured_image', "#{Rails.root}/spec/support/featured_image.jpg"
end

When(/^I click "(.*?)"$/) do |link_text|
  stub_request(:post, "https://api.twitter.com/1.1/statuses/update.json")
  allow_any_instance_of(Twitter::REST::Client).to receive(:update).and_return(twitter_status_update_response)
  click_link_or_button link_text
end

Then(/^the author should see the featured image$/) do
  page.should have_css '#featured-image'
end

Then(/^the author should not see any markdown$/) do
  page.should_not have_content '##'
end

Then(/^(?:I|he) should see "(.*?)"$/) do |text|
  page.should have_content text
end

Then(/^the author should see the post$/) do
  page.should have_content @post.title
end

Then(/^the twitter message input should be disabled$/) do
  page.should have_css '#post_twitter_message.disabled'
end
