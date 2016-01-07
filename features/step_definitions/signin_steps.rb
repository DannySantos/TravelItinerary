Given(/^a traveller is on the sign in page$/) do
  Traveller.create!(username: "vvhiteknight", email: "test@test.com", password: "password", password_confirmation: "password")
  visit new_traveller_session_path
end

Given(/^they enter valid login details$/) do
  fill_in "Email", with: "test@test.com"
  fill_in "Password", with: "password"
end

Given(/^they click the sign in button$/) do
  click_button "Log in"
end

Then(/^they should be taken to their dashboard$/) do
  expect(page.current_path).to eq("/journeys")
end