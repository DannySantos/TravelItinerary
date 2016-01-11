Given(/^a visitor is on the homepage$/) do
  visit root_path
end

Given(/^they choose to sign up as a provider$/) do
  click_link ("Sign up as Provider")
end

Then(/^they are taken to the provider sign up page$/) do
  expect(page).to have_content("Sign up")
end

Then(/^they fill in the provider form with valid details$/) do
  fill_in "Username", with: "vvhiteknight"
  fill_in "Email", with: "test@test.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
end

Then(/^they select Sign up$/) do
  click_button ("Sign up")
end

Then(/^they are signed up as a provider$/) do
  expect(Provider.last.username).to eq("vvhiteknight")
  expect(Provider.last.email).to eq("test@test.com")
end

Then(/^they are taken to the provider dashboard$/) do
  expect(page).to have_content ("Provider Dashboard")
end