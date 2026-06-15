class Venue < ApplicationRecord
  validates :name, presence: true

  def contact_name
    [ contact_first_name, contact_last_name ].compact_blank.join(" ").presence
  end

  def location_display
    [ city, state ].compact_blank.join(", ").presence
  end
end
