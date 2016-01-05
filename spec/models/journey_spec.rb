require 'rails_helper'

RSpec.describe Journey, type: :model do
  describe "Creating a journey" do
    before do
      @traveller = Traveller.create!(username: "vvhiteknight", email: "test@test.com", password: "password", password_confirmation: "password")
      journey = Journey.create!(title: "Australia Holiday", description: "Going on holiday to Australia")
      @traveller.journeys << journey

      @traveller1 = Traveller.create!(username: "SimonKnight", email: "test1@test.com", password: "password", password_confirmation: "password")
      journey1 = Journey.create!(title: "Maldives Holiday", description: "Going on holiday to Maldives")
      @traveller1.journeys << journey1
    end

    it "should create a journey" do
      expect(@traveller.journeys.last.title).to eq("Australia Holiday")
      expect(@traveller.journeys.last.description).to eq("Going on holiday to Australia")
      expect(@traveller.journeys.count).to eq(1)

      expect(@traveller1.journeys.last.title).to eq("Maldives Holiday")
      expect(@traveller1.journeys.last.description).to eq("Going on holiday to Maldives")
      expect(@traveller1.journeys.count).to eq(1)
    end

    context "Missing title" do
      before do
      @journey = Journey.new(description: "Going on holiday to Australia")
      end

      it "should verify a title has been entered" do
        expect {@journey.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Title can\'t be blank')
        expect(Journey.count).to eq(2)
      end
    end

    context "Missing description" do
      before do
      @journey = Journey.new(title: "Australia Holiday")
      end

      it "should verify a description has been entered" do
        expect {@journey.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Description can\'t be blank')
        expect(Journey.count).to eq(2)
      end
    end
  end
end
