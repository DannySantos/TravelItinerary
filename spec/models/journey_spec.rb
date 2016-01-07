require 'rails_helper'

RSpec.describe Journey, type: :model do
  describe "Creating a journey" do
    before do
      @traveller = Traveller.create!(username: "vvhiteknight", email: "test@test.com", password: "password", password_confirmation: "password")
      journey = Journey.create!(title: "Australia Holiday", description: "Going on holiday to Australia", start_date: "01-01-2016", end_date: "01-02-2016")
      @traveller.journeys << journey

      @traveller1 = Traveller.create!(username: "SimonKnight", email: "test1@test.com", password: "password", password_confirmation: "password")
      journey1 = Journey.create!(title: "Maldives Holiday", description: "Going on holiday to Maldives", start_date: "01-01-2016", end_date: "01-02-2016")
      @traveller1.journeys << journey1
    end

    it "should create a journey" do
      expect(@traveller.journeys.last.title).to eq("Australia Holiday")
      expect(@traveller.journeys.last.description).to eq("Going on holiday to Australia")
      expect(@traveller.journeys.last.start_date).to eq("01-01-2016")
      expect(@traveller.journeys.last.end_date).to eq("01-02-2016")
      expect(@traveller.journeys.count).to eq(1)

      expect(@traveller1.journeys.last.title).to eq("Maldives Holiday")
      expect(@traveller1.journeys.last.description).to eq("Going on holiday to Maldives")
      expect(@traveller1.journeys.count).to eq(1)
    end

    context "Missing title" do
      before do
      @journey = Journey.new(description: "Going on holiday to Australia", start_date: "01-01-2016", end_date: "01-02-2016")
      end

      it "should verify a title has been entered" do
        expect {@journey.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Title can\'t be blank')
        expect(Journey.count).to eq(2)
      end
    end

    context "Missing description" do
      before do
      @journey = Journey.new(title: "Australia Holiday", start_date: "01-01-2016", end_date: "01-02-2016")
      end

      it "should verify a description has been entered" do
        expect {@journey.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Description can\'t be blank')
        expect(Journey.count).to eq(2)
      end
    end

    context "Missing start date" do
      before do
        @journey = Journey.new(title: "Australia Holiday", description: "Going on holiday to Australia", end_date: "01-02-2016")
      end

      it "should verify a start date has been selected" do
        expect {@journey.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Start date can\'t be blank')
      end
    end

    context "Missing end date" do
      before do
        @journey = Journey.new(title: "Australia Holiday", description: "Going on holiday to Australia", start_date: "01-02-2016")
      end

      it "should verify a start date has been selected" do
        expect {@journey.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: End date can\'t be blank')
      end
    end

    context "End date before start date" do
      before do
        @journey = Journey.new(title: "Australia Holiday", description: "Going on holiday to Australia", start_date: "01-02-2016", end_date: "01-01-2016")
      end

      it "should verify an end date cannot before the start date" do
        expect {@journey.save!}.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: End date can\'t be set before the start date')
      end
    end
  end
end
