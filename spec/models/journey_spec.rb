require 'rails_helper'

RSpec.describe Journey, type: :model do
  describe "Creating a journey" do
    before do
      Journey.create!(title: "Australia Holiday", description: "Going on holiday to Australia")
    end

    it "should create a journey" do
      expect(Journey.last.title).to eq("Australia Holiday")
      expect(Journey.last.description).to eq("Going on holiday to Australia")
      expect(Journey.count).to eq(1)
    end
  end
end
