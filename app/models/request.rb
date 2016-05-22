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

  def from_time_format
    self.date_from.strftime("%d/%m/%Y")
  end

  def to_time_format
    self.date_to.strftime("%d/%m/%Y")
  end
end