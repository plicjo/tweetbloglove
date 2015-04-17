When(/^the author publishes the post later$/) do
  check 'post_publish_in_future'
  click_button 'Update Post'
end

Then(/^the post should be queued up to be published$/) do
  expect(ActiveJob::Base.queue_adapter.enqueued_jobs.size).to eq 1
end