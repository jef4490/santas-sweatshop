require 'bundler/setup'
Bundler.require

require_all('app/')

configure :development do
  set :database, "sqlite3:///database.db"
end

configure :production do
  db = URI.parse(ENV['devej5lsgcubdc'] || 'postgres://localhost/mydb')

  ActiveRecord::Base.establish_connection(
      :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host     => db.host,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
      )

end

# set(:database, {adapter: "sqlite3", database: "workshop.sqlite3"})
