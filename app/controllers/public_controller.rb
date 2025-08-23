class PublicController < ActionController::Base
  # Skip authentication for public pages
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def landing
    # Static landing page with band links
  end
end