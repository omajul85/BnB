require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/space'
require_relative './models/user'
require_relative './models/request'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize

if ENV['RACK_ENV'] == 'test'
	DataMapper.auto_migrate!
end