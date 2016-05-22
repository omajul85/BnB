require 'data_mapper'
require 'dm-postgres-adapter'

class Request
  include DataMapper::Resource

  property :id, Serial
  property :date_from, Date, required: true
  property :date_to, Date, required: true
  property :owner_id, Integer, required: true
  property :status, String, default: "Not confirmed"

  belongs_to :user
  belongs_to :space
end