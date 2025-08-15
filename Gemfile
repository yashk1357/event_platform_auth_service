source "https://rubygems.org"

gem "rails", "~> 8.0.2", ">= 8.0.2.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

# Solid queue, cache, cable for background jobs, caching, WebSockets
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Deployment
gem "kamal", require: false
gem "thruster", require: false

# Authentication & JWT
gem "bcrypt"                      # Needed for password_digest
gem "jwt"                         # Token handling
gem "omniauth"                    # OAuth base
gem "omniauth-google-oauth2"      # Google OAuth
gem "pundit"                      # Authorization
gem "sidekiq"                     # Background jobs

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails"               # For testing
end
