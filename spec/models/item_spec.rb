require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Item" do
    before do
      @journey = Journey.create!(title: "Australia Holiday", description: "Going on holiday to Australia")
    end

    it "should add a todo to a journey" do
      todo = Item.create!(description: "Visit the great barrier reef")
      @journey.items << todo

      expect(@journey.items.last.description).to eq("Visit the great barrier reef")
      expect(@journey.items.count).to eq(1)
    end
  end
end
