module ApplicationHelper
  STATUS_BADGE_CLASSES = {
    "idea" => "secondary",
    "rehearsing" => "warning text-dark",
    "ready" => "success",
    "retired" => "dark"
  }.freeze

  def status_badge_class(status)
    STATUS_BADGE_CLASSES.fetch(status.to_s, "secondary")
  end
end
