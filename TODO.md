# LWC App — TODO & Ideas

## Core Models to Build

### Song
- Fields: title, key, tempo, time_signature, notes, status (draft/active/retired)
- Associations: has_many :chord_charts, has_many :recordings, has_many :setlist_items
- Chord charts stored as structured data (chords + lyrics per section) or markdown
- Support multiple versions/arrangements of the same song

### Venue
- Fields: name, address, city, contact_name, contact_email, contact_phone, notes, last_contacted_at
- Associations: has_many :shows
- Track relationship status (never played, played before, in contact, booked)

### Show
- Fields: date, venue, type (gig/want_to_play), status (confirmed/tentative/idea), notes, setlist
- Associations: belongs_to :venue, has_many :setlist_items -> songs

### Band (related bands)
- Fields: name, genre, contact_name, contact_email, instagram, notes, last_contacted_at
- Track relationship: played_with, want_to_play_with, seen_live

### PracticeSession
- Fields: date, location, notes, goals
- Associations: has_many :practice_songs -> songs

### CalendarEvent (polymorphic or unified)
- Unify shows and practice sessions into a single calendar view

---

## Features to Build

### 1. Venue Management & Outreach
- CRUD interface for venues with contact info
- "Last contacted" tracking per venue
- Scheduled job (Sidekiq or GoodJob) to surface venues due for a check-in
- Email draft generation via Claude skill: given venue context, draft a friendly booking inquiry
- Outreach log to record what was sent and when

### 2. Chord Chart Tool
- Song model with section-based chord/lyric editor (verse, chorus, bridge, etc.)
- Claude skill: given rough notes or a voice description, generate a clean formatted chord chart
- PDF export of chord charts for practice use
- Support for capo and transposition

### 3. Calendar Page
- Unified view of practice sessions and shows
- Month/week view using a simple JS calendar (or FullCalendar via importmap)
- Show notes on what's being practiced at each session
- "Shows we want to play" vs "confirmed shows" differentiation
- Public-facing upcoming shows view on the landing page

### 4. Related Bands Directory
- Directory of local bands with contact info and notes
- Tag bands: played_with, want_to_collaborate, want_to_see_live
- Periodic outreach job: surface bands that haven't been contacted in 90+ days
- Claude skill: draft a collab or joint-show pitch email given a band's info

### 5. Admin Area
- Simple password-protected admin (Devise or has_secure_password)
- Dashboard showing: upcoming shows, next practice, songs in rotation, venues due for outreach
- No public registration — single-user or small team

### 6. Public Landing Page Improvements
- Add upcoming shows section to `/linktree`
- Add a "listen" section with embedded player or latest release
- Improve PWA config (currently themed red, should match band branding)

---

## Claude Skills to Write

- `chord-chart`: Generate a formatted chord chart from rough input or song description
- `venue-outreach`: Draft a venue booking inquiry given contact and history context
- `band-collab-pitch`: Draft an outreach email to a related band about playing together
- `setlist-builder`: Suggest a setlist given song catalog and show context (length, vibe, venue)
- `practice-planner`: Suggest what to focus on at the next practice based on upcoming shows and recent sessions

---

## Infrastructure / Housekeeping

- [ ] Add GoodJob (or Sidekiq) for background jobs / scheduled outreach
- [ ] Add Active Storage for song recordings and photos
- [ ] Configure root route once admin or a meaningful landing exists
- [ ] Write first RSpec model specs as models are added
- [ ] Set up seeds with sample data for local development
