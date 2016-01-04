Given(/^a customer is on the homepage$/) do
  visit root_path
  expect(page).to have_content "Add New Journey"
end

Given(/^they select create a new journey$/) do
  click_link "Create new journey"
end

Then(/^they should be on the create new journey page$/) do
  expect(page).to have_content "Create a new journey"
end

Given(/^they enter valid details$/) do
  fill_in "Title", with: "Australia Holiday"
  fill_in "Description", with: "My amazing holiday to Australia"
end

Then(/^a journey is created$/) do
  expect(Journey.count).to eq(1)
  expect(Journey.last.title).to eq("Australia Holiday")
  expect(Journey.last.description).to eq("My amazing holiday to Australia")
end

Then(/^they are redirected to the journeys page$/) do
  expect(page.current_path).to eq("/journeys")
end

Given(/^they enter a description$/) do
  fill_in "Description", with: "My amazing holiday to Australia"
end

Then(/^the journey is not created$/) do
  expect(Journey.count).to eq(0)
end

Then(/^they are shown a message saying "(.*?)"$/) do |message|
  expect(page).to have_content message
end

Given(/^they enter a title$/) do
  fill_in "Title", with: "Australia Holiday"
end

Then(/^they press submit$/) do
  click_button "Create Journey"
end