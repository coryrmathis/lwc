FactoryBot.define do
  factory :song do
    title { "Test Song" }
    status { "idea" }
    key { "G" }
    bpm { 120 }
    length_seconds { 210 }
    is_cover { false }
    lyrics { nil }
    notes { nil }
    original_artist { nil }
  end
end
