Given(/^a provider is signed in$/) do
  visit root_path
  @traveller = Traveller.create!(username: "vvhiteknight", email: "test@test.com", password: "password", password_confirmation: "password", type: "Provider")
  click_link ("Sign in as a Provider")
  fill_in "Email", with: "test@test.com"
  fill_in "Password", with: "password"
  click_button ("Log in")
end

Given(/^a provider is on the provider dashboard$/) do
  expect(page).to have_content("Provider Dashboard")
end

Given(/^they select to add a new property$/) do
  click_link ("Add Rental Property")
end

Given(/^they enter valid property details$/) do
  fill_in "Title", with: "My Amazing House"
  fill_in "Address", with: "18 Church Road, Grafham, Huntingdon, Cambs"
  fill_in "Country", with: "United Kingdom"
  fill_in "Description", with: "Nice house"
end

Given(/^they they select the create property button$/) do
  click_button ("Add Property")
  sleep 3
end

Then(/^a property item should be created$/) do

  expect(@traveller.properties.last.title).to eq("My Amazing House")
end

Then(/^they should see the property$/) do
  expect(page).to have_content ("My Amazing House")
end