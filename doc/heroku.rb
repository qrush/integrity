$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))
gem "data_objects", "= 0.10.0"
require "integrity"

Integrity.configure do |c|
  c.database  ENV["DATABASE_URL"]
  c.directory "tmp"
  c.base_url  "http://myapp.heroku.com"
  c.log       "tmp/integrity.log"
  c.build_all!
  c.push    :github, "SECRET"
  c.builder :threaded, 5
end

