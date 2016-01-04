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

    context "Missing title" do
      before do
      journey = Journey.create!(description: "Going on holiday to Australia")
      end

      it "should verify a title has been entered" do
        expect(Journey.count).to eq(0)
        expect {journey.save!}.to  raise_error(ActiveRecord::RecordInvalid,'Validation failed: Title can\'t be blank')
      end
    end
  end
end
