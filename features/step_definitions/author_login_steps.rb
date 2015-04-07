Given(/^a visitor is on the sign up page$/) do
  visit new_author_registration_path
end

Given(/^an author has already signed up$/) do
  @author = create :author
end

Given(/^the author is on the sign in page$/) do
  visit new_author_session_path
end

When(/^the visitor signs up to be an author$/) do
  fill_in 'author_email', with: Faker::Internet.email
  fill_in 'author_password', with: 'password'
  fill_in 'author_password_confirmation', with: 'password'
  click_on 'Sign up'

end

When(/^the author signs in$/) do
  fill_in 'author_email', with: @author.email
  fill_in 'author_password', with: @author.password
  click_on 'Log in'
end

Then(/^the (?:author|visitor|"([^"]*?)") should see "(.*?)"$/) do |stakeholder, text|
  page.should have_content text
end