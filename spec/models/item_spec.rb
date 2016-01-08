require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Item" do
    before do
      @journey = Journey.create!(title: "Australia Holiday", description: "Going on holiday to Australia", start_date: "01-01-2016", end_date: "01-02-2016")
    end

    it "should add a todo to a journey" do
      todo = Item.create!(destination: "Australia", description: "Visit the great barrier reef", notes: "Pick up some money from bank")
      @journey.items << todo

      expect(@journey.items.last.destination).to eq("Australia")
      expect(@journey.items.last.description).to eq("Visit the great barrier reef")
      expect(@journey.items.last.notes).to eq("Pick up some money from bank")
      expect(@journey.items.count).to eq(1)
    end

    it "should validate the presence of a destination" do
      todo = Item.new(description: "Visit the great barrier reef")
      @journey.items << todo

      expect {todo.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Destination can\'t be blank')
      expect(@journey.items.count).to eq(0)
    end

    it "should validate the presence of a description" do
      todo = Item.new(destination: "Australia")
      @journey.items << todo

      expect {todo.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Description can\'t be blank')
      expect(@journey.items.count).to eq(0)
    end
  end

  describe "Geocode" do
    before do
      @item = Item.create!(destination: "Australia", address: "Melbourne", description: "Visit the art gallery", notes: "Pick up some money from bank")
      
      Geocoder.configure(:lookup => :test)

      Geocoder::Lookup::Test.add_stub(
      "Australia, Melbourne", [
        {
          'latitude'     => -37.814107,
          'longitude'    => 144.96328,
        }
       ]
      )
    end

    it "should convert destination and address into a string" do
      expect(@item.geocode_string).to eq("Australia, Melbourne")
    end

    it "should convert the geocode string into lat / lng coordinates" do
      expect(@item.latitude).to eq(-37.814107)
      expect(@item.longitude).to eq(144.96328)
    end
  end


end
