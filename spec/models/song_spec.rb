require "rails_helper"

RSpec.describe Song, type: :model do
  describe "validations" do
    it "is valid with required attributes" do
      song = build(:song)
      expect(song).to be_valid
    end

    it "requires a title" do
      song = build(:song, title: nil)
      expect(song).not_to be_valid
      expect(song.errors[:title]).to include("can't be blank")
    end

    it "requires a status" do
      song = build(:song, status: nil)
      expect(song).not_to be_valid
    end

    it "is valid without a chord_chart" do
      song = build(:song, chord_chart: nil)
      expect(song).to be_valid
    end
  end

  describe "#length_display" do
    it "formats seconds as M:SS" do
      song = build(:song, length_seconds: 222)
      expect(song.length_display).to eq("3:42")
    end

    it "zero-pads seconds" do
      song = build(:song, length_seconds: 65)
      expect(song.length_display).to eq("1:05")
    end

    it "returns nil when length_seconds is blank" do
      song = build(:song, length_seconds: nil)
      expect(song.length_display).to be_nil
    end
  end

  describe "status enum" do
    it "defaults to idea" do
      song = Song.new(title: "Test")
      expect(song.status).to eq("idea")
    end

    it "supports all statuses" do
      %w[idea rehearsing ready retired].each do |s|
        song = build(:song, status: s)
        expect(song).to be_valid
      end
    end
  end
end
