require 'rails_helper'

RSpec.describe Property, type: :model do
  describe "Creating a property" do

    before(:each) do

      Geocoder.configure(:lookup => :test)

      Geocoder::Lookup::Test.add_stub(
      "18 Church Road, Grafham, Huntingdon, Cambs, United Kingdom", [
        {
          'latitude'     => 52.310174,
          'longitude'    => -0.3044844,
        }])
      Geocoder::Lookup::Test.add_stub(
      ", United Kingdom", [
        {
          'latitude'     => 52.310174,
          'longitude'    => -0.3044844,
        }])
      Geocoder::Lookup::Test.add_stub(
      "18 Church Road, Grafham, Huntingdon, Cambs, ", [
        {
          'latitude'     => 52.310174,
          'longitude'    => -0.3044844,
        }])
    end

    it "check a property is created" do
      Property.create!(description: "Property one", address: "18 Church Road, Grafham, Huntingdon, Cambs", country: "United Kingdom")
      expect(Property.last.description).to eq("Property one")
      expect(Property.last.address).to eq("18 Church Road, Grafham, Huntingdon, Cambs")
    end

    it "should validate the presence of a description" do
      property = Property.new(address: "18 Church Road, Grafham, Huntingdon, Cambs", country: "United Kingdom")

      expect {property.save!}.to  raise_error(ActiveRecord::RecordInvalid,'Validation failed: Description can\'t be blank')
      expect(Property.count).to eq(0)
    end

    it "should validate the presence of an address" do
      property = Property.new(description: "Property one", country: "United Kingdom")
      expect {property.save!}.to  raise_error(ActiveRecord::RecordInvalid,'Validation failed: Address can\'t be blank')
      expect(Property.count).to eq(0)
    end
    it "should validate the presence of a country" do
      property = Property.new(description: "Property one", address: "18 Church Road, Grafham, Huntingdon, Cambs")

      expect {property.save!}.to  raise_error(ActiveRecord::RecordInvalid,'Validation failed: Country can\'t be blank')
      expect(Property.count).to eq(0)
    end

    it "should convert address and country into a string" do
      property = Property.create!(description: "Property one", address: "18 Church Road, Grafham, Huntingdon, Cambs", country: "United Kingdom")
      expect(property.geocode_string).to eq("18 Church Road, Grafham, Huntingdon, Cambs, United Kingdom")
    end

    it "should geocode the address of the property" do
      Property.create!(description: "Property one", address: "18 Church Road, Grafham, Huntingdon, Cambs", country: "United Kingdom")
      expect(Property.last.latitude).to eq(52.310174)
      expect(Property.last.longitude).to eq(-0.3044844)
    end

    it "should make sure a property belongs to a Provider" do
        provider = Provider.create!(username: "vvhiteknight", email: "test@test.com", password: "password", password_confirmation: "password", type: "Provider")
        property = Property.create!(description: "Property one", address: "18 Church Road, Grafham, Huntingdon, Cambs", country: "United Kingdom")
        provider.properties << property
        expect(provider.properties.count).to eq(1)
        expect(provider.properties.last.description).to eq("Property one")
    end
  end

end
