
Given(/^a traveller is signed in$/) do
  @traveller = Traveller.create!(username: "vvhiteknight", email: "test@test.com", password: "password", password_confirmation: "password")
  visit new_traveller_session_path
  
  fill_in "Email", with: "test@test.com"
  fill_in "Password", with: "password"
  click_button "Log in"
end

Given(/^a traveller has a journey$/) do
  journey = Journey.create!(title: "Australia Holiday", description: "Going on holiday to Australia", start_date: "01-01-2016", end_date: "01-02-2016")
  @traveller.journeys << journey
  visit journeys_path
end

Given(/^they select to add a new todo item$/) do
  click_link("Add New Todo Item")
  sleep 1
end

Given(/^they enter valid todo item details$/) do
  fill_in "Destination", with: "Australia"
  fill_in "Address", with: "Melbourne"
  fill_in "Description", with: "Visit an art gallery"
  fill_in "Notes", with: "Remember to pick up my money from travelex"
  sleep 1
end

Given(/^they they select the create item button$/) do
  click_button("Create Item")
  sleep 1
end

Then(/^a todo item should be created$/) do
  expect(@traveller.journeys[0].items.first.destination).to eq("Australia")
  expect(@traveller.journeys[0].items.first.address).to eq("Melbourne")
  expect(@traveller.journeys[0].items.first.description).to eq("Visit an art gallery")
  expect(@traveller.journeys[0].items.first.notes).to eq("Remember to pick up my money from travelex")
  expect(@traveller.journeys[0].items.first.latitude).to eq(-37.814107)
  expect(@traveller.journeys[0].items.first.longitude).to eq(144.96328)
  expect(@traveller.journeys[0].items.count).to eq(1)
end

Then(/^they should see the todo item$/) do
  expect(page).to have_content("Visit an art gallery")
end