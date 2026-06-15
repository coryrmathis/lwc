# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This is the homebase for **Lousy With Coyotes (LWC)**, a band management Rails app. It serves as both a public-facing site and an internal band operations tool — tracking venues, shows, songs, practice sessions, and related bands. The `/skills` directory (to be created) will house Claude Code skills for band-specific tasks.

## Tech Stack

- **Ruby 3.4.4 / Rails 7.2** with PostgreSQL
- **Frontend**: Bootstrap 5, Hotwire (Turbo + Stimulus), ImportMap (no webpack/Node build step)
- **Testing**: RSpec + FactoryBot + Capybara/Selenium
- **Linting/Security**: RuboCop (Rails Omakase), Brakeman
- **CI**: GitHub Actions (`.github/workflows/ci.yml`)

## Commands

```bash
# Development
bin/rails server
bin/rails console
bin/rails db:migrate
bin/rails db:seed

# Testing
bundle exec rspec                          # all specs
bundle exec rspec spec/models/song_spec.rb # single file
bundle exec rspec spec/models/song_spec.rb:42  # single example

# Linting & security
bundle exec rubocop
bundle exec rubocop -a                     # auto-fix
bundle exec brakeman

# Assets (Bootstrap is npm-managed, not bundled)
bin/importmap pin <package>
```

## Architecture

### Current State
The app is in early development — one controller, one view, no database models yet. The landing page at `/linktree` is a static link aggregator (Apple Music, Instagram).

### Routing Pattern
Routes split into public (no auth) and will eventually include an authenticated admin section. The root `/` is not yet wired up.

### Frontend Conventions
- Bootstrap 5 classes for layout; custom CSS inline or in `app/assets/stylesheets/`
- Stimulus controllers in `app/javascript/controllers/` for interactivity
- Turbo handles navigation — avoid full-page JS rewrites

### Database
PostgreSQL. Schema managed via migrations. No tables exist yet — the first migrations will introduce the core models described in TODO.md.

### PWA
The app ships a manifest and service worker skeleton. Theme colors are configured in `app/views/pwa/manifest.json.erb`.

## Custom Claude Skills

Band-specific Claude skills will live in `.claude/skills/` (or a top-level `skills/` directory). These automate recurring band operations like generating chord charts, drafting venue outreach emails, and scheduling follow-up communications.
