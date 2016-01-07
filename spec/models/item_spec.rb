require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Item" do
    before do
      @journey = Journey.create!(title: "Australia Holiday", description: "Going on holiday to Australia", start_date: "01-01-2016", end_date: "01-02-2016")
    end

    it "should add a todo to a journey" do
      todo = Item.create!(destination: "Australia", description: "Visit the great barrier reef")
      @journey.items << todo

      expect(@journey.items.last.destination).to eq("Australia")
      expect(@journey.items.last.description).to eq("Visit the great barrier reef")
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
end
