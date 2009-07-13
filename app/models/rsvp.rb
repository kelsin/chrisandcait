class Rsvp < ActionMailer::Base
  def notify(guest)
    from "rsvp-notify@chrisandcait.com"
    recipients "rsvp@chrisandcait.com"
    subject "New RSVP: #{guest.name}"
    body :guest => guest
  end
end
