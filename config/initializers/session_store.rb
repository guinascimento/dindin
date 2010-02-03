# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dindin_session',
  :secret      => '777cfa48ea3d4d4db2b8b56e999165f98cae054ce781465d387d202783f7dbb954aefd972b2984a3d7a6d4fdc26b3f0335475f78245113c254fb608c1811c34a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
