Given(/^a visitor is on the sign up page$/) do
  visit new_author_registration_path
end

When(/^the visitor signs up to be an author$/) do
  fill_in 'author_email', with: Faker::Internet.email
  fill_in 'author_password', with: 'password'
  fill_in 'author_password_confirmation', with: 'password'
  click_on 'Sign up'

end

Then(/^the visitor should see "(.*?)"$/) do |text|
  page.should have_content text
end