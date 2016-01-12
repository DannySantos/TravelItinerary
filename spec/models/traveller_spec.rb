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

  describe "facebook signup" do
    before(:each) do
      OmniAuth.config.mock_auth[:facebook] = nil
    end

    before do
      OmniAuth.config.test_mode = true

      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({"provider"=>"facebook",
                       "uid"=>"1699874960291231",
                       "info"=>{"email"=>"test5@test.com", "name"=>"Simon Knight", "image"=>"http://graph.facebook.com/169987434491231/picture"},
                       "credentials"=>
                        {"token"=>
                          "12345",
                         "expires_at"=>1457803746,
                         "expires"=>true},
                       "extra"=>{"raw_info"=>{"name"=>"Simon Knight", "email"=>"simon.mobilep@gmail.com", "id"=>"12345"}}})
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end

    it "should successfully create a user" do
      @traveller = Traveller.from_omniauth(Rails.application.env_config["omniauth.auth"])
      expect(Traveller.count).to eq(1)
      expect(Traveller.last.email).to eq("test5@test.com")
    end
  end
end
