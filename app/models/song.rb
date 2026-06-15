class Song < ApplicationRecord
  enum :status, { idea: "idea", rehearsing: "rehearsing", ready: "ready", retired: "retired" }

  validates :title, presence: true
  validates :status, presence: true

  def length_display
    return nil if length_seconds.blank?

    minutes = length_seconds / 60
    seconds = length_seconds % 60
    format("%d:%02d", minutes, seconds)
  end
end
