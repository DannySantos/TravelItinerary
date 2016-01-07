Given(/^a traveller has a todo item$/) do
  item = Item.create(description: "Visit Museum", journey_id: 1)
end

Then(/^they select edit on a todo item$/) do
  click_button('Edit')
end

Then(/^they edit the todo item$/) do
  fill_in "Description", with: "Visit Aquarium"
end

Then(/^they select the save button$/) do
  click_button('Save')
end

Then(/^the todo item should be updated$/) do
  expect(@traveller.journeys[0].item.last.description).to eq("Visit Aquarium")
end

Then(/^they should see the todo item update$/) do
  expect(page).to have_content("Visit Aquarium")
end