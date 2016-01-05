Given(/^a visitor is on the sign up page$/) do
  visit new_traveller_registration_path
  expect(page).to have_content "Sign up"
end

Given(/^they enter valid signup details$/) do
  fill_in "Username", with: "vvhiteknight"
  fill_in "Email", with: "test@test.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
end

Given(/^they select the signup button$/) do
  click_button "Sign up"
end

Then(/^the account is created$/) do
  expect(Traveller.count).to eq(1)
  expect(Traveller.last.username).to eq("vvhiteknight")
  expect(Traveller.last.email).to eq("test@test.com")
end

Then(/^they are redirected to their dashboard$/) do
  expect(page).to have_content "Welcome vvhiteknight"
end

Given(/^they enter valid details excluding the username$/) do
  fill_in "Email", with: "test@test.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
end

Then(/^the account is not created$/) do
  expect(Traveller.count).to eq(0)
end

Given(/^they enter valid details with an already taken username$/) do
  Traveller.create!(username: "vvhiteknight", email: "bingo@bingo.com", password: "password", password_confirmation: "password")
  fill_in "Username", with: "vvhiteknight"
  fill_in "Email", with: "test@test.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
end

Then(/^the account is not created as the username is already taken$/) do
  expect(Traveller.count).to eq(1)
  expect(Traveller.last.email).to eq("bingo@bingo.com")
  expect(Traveller.last.email).to_not eq("test@test.com")
end
