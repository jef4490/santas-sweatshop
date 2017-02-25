require 'bundler/setup'
Bundler.require

require_all('app/')

set(:database, {adapter: "sqlite3", database: "workshop.sqlite3"})
