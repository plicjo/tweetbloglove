When(/^I change my time zone and submit the form$/) do
  select '(GMT-07:00) Mountain Time (US & Canada)', from: 'author_time_zone'
  click_button 'Update Author'
end