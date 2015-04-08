Given(/^is on the new post page$/) do
  visit new_post_path
end

When(/^I write a post using Markdown$/) do
  fill_in 'post_title', with: 'Example Post'
  fill_in 'post_body',  with: '## This will be a h2'
end

When(/^I upload an image$/) do
  attach_file 'post_featured_image', "#{Rails.root}/spec/support/featured_image.jpg"
end

When(/^I click "(.*?)"$/) do |link_text|
  click_link_or_button link_text
end

Then(/^the author should see the featured image$/) do
  page.should have_css '#featured-image'
end

Then(/^the author should not see any markdown$/) do
  page.should_not have_content '##'
end