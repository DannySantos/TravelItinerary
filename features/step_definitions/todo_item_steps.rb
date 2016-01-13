Given(/^a todo item exists$/) do
  @item = Item.create!(destination: "Australia", address: "Melbourne", description: "Visit the art gallery", notes: "Pick up some money from bank")
  @traveller.journeys.first.items << @item
end

Given(/^a rental properties exist$/) do
  Geocoder.configure(:lookup => :test)

  Geocoder::Lookup::Test.add_stub(
  "Docklands, Melbourne, Australia", [
    {
      'latitude'     => -37.8150178,
      'longitude'    => 144.9460078,
    }])
  Geocoder::Lookup::Test.add_stub(
  "Geelong, Australia", [
    {
      'latitude'     => -38.1485437,
      'longitude'    => 144.3613479,
    }])

  property = Property.create!(title: "Property One", description: "A property within range", address: "Docklands, Melbourne", country: "Australia")
  property1 = Property.create!(title: "Property Two", description: "A property outside range", address: "Geelong", country: "Australia")
  visit journeys_path
end

Given(/^they select to view nearby rental properties$/) do
  click_link ("View Rentals")
end

Then(/^they should see the number of rentals near to that item$/) do
  expect(page).to have_content("Property One")
  expect(page).to_not have_content("Property Two")
end