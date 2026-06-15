require "rails_helper"

RSpec.describe Venue, type: :model do
  describe "validations" do
    it "is valid with required attributes" do
      venue = build(:venue)
      expect(venue).to be_valid
    end

    it "requires a name" do
      venue = build(:venue, name: nil)
      expect(venue).not_to be_valid
      expect(venue.errors[:name]).to include("can't be blank")
    end

    it "is valid without optional fields" do
      venue = build(:venue, contact_first_name: nil, contact_last_name: nil,
                            contact_email: nil, phone: nil, city: nil, state: nil)
      expect(venue).to be_valid
    end
  end

  describe "#contact_name" do
    it "returns full name when both are present" do
      venue = build(:venue, contact_first_name: "Jane", contact_last_name: "Smith")
      expect(venue.contact_name).to eq("Jane Smith")
    end

    it "returns first name only when last name is missing" do
      venue = build(:venue, contact_first_name: "Jane", contact_last_name: nil)
      expect(venue.contact_name).to eq("Jane")
    end

    it "returns nil when both are blank" do
      venue = build(:venue, contact_first_name: nil, contact_last_name: nil)
      expect(venue.contact_name).to be_nil
    end
  end

  describe "#location_display" do
    it "returns 'City, ST' when both are present" do
      venue = build(:venue, city: "Austin", state: "TX")
      expect(venue.location_display).to eq("Austin, TX")
    end

    it "returns city only when state is missing" do
      venue = build(:venue, city: "Austin", state: nil)
      expect(venue.location_display).to eq("Austin")
    end

    it "returns nil when both are blank" do
      venue = build(:venue, city: nil, state: nil)
      expect(venue.location_display).to be_nil
    end
  end
end
