Then(/^they select delete on a todo item$/) do
  click_link('Delete')
  sleep 1
end

Then(/^the todo item should be deleted$/) do
  expect(@traveller.journeys[0].items.count).to eq(0)
end

Then(/^they should see the todo item removed$/) do
  expect(page).to_not have_content("Visit Museum")
end