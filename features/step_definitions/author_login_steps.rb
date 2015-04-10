Given(/^the author is on the home page$/) do
  visit root_path
end

When(/^the author signs in with Twitter$/) do
  click_on 'Sign In'
end

Given(/^an author is logged in$/) do
  steps %Q{
    Given the author is on the home page
    When  the author signs in with Twitter
  }
end

When(/^the author clicks "(.*?)"$/) do |link_text|
  click_link_or_button link_text
end

Then(/^the (?:author|visitor|"([^"]*?)") should see "(.*?)"$/) do |stakeholder, text|
  page.should have_content text
end