require 'rails_helper'

RSpec.describe Traveller, type: :model do
  describe "Creating a traveller" do 
      before do
        Traveller.create!(username: "vvhiteknight", email: "test@test.com", password: "password", password_confirmation: "password")
      end

      it "should create a traveller" do
        expect(Traveller.last.username).to eq("vvhiteknight")
        expect(Traveller.last.email).to eq("test@test.com")
        expect(Traveller.all.length).to eq(1)
      end

      it "should verify that their username is unique" do
        traveller = Traveller.new(username: "vvhiteknight", email: "test1@test.com", password: "password", password_confirmation: "password")
        
        expect {traveller.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Username has already been taken')
        expect(Traveller.last.email).to eq("test@test.com")
        expect(Traveller.all.length).to eq(1)
      end

      it "should verify the presense of a username" do
        user = Traveller.new(email: "test1@test.com", password: "password", password_confirmation: "password")

        expect {user.save!}.to  raise_error(ActiveRecord::RecordInvalid,'Validation failed: Username can\'t be blank')
        expect(Traveller.last.email).to eq("test@test.com")
        expect(Traveller.all.length).to eq(1)
      end
  end

  describe "A traveller signs up as a provider" do
      before do
        Traveller.create!(username: "Simon123", email: "test@test.com", password: "password", password_confirmation: "password", type: "Provider")
      end

      it "should create a provider" do
        expect(Traveller.last.username).to eq("Simon123")
        expect(Traveller.last.email).to eq("test@test.com")
        expect(Traveller.last.type).to eq("Provider")
        expect(Traveller.all.length).to eq(1)
      end
  end
end
