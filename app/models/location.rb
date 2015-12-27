class Location < ActiveRecord::Base
  has_paper_trail

  validates :coordinates, :device_id, :taken_at, presence: true
  belongs_to :device

  delegate :truck, to: :device

  attr_accessor :latitude, :longitude, :device_identifier

  def initialize(attributes = nil)
    super(attributes)

    self.taken_at ||= Time.zone.now
    self.latitude = attributes[:latitude] || 0
    self.longitude = attributes[:longitude] || 0
    self.device_id = device_id_from_identifier(attributes[:device_identifier])
  end

  def latitude
    self.coordinates.first
  end

  def longitude
    self.coordinates.last
  end

  def latitude=(value)
    self.coordinates ||= [0, 0]
    self.coordinates[0] = value
  end

  def longitude=(value)
    self.coordinates ||= [0, 0]
    self.coordinates[1] = value
  end

  def device_id_from_identifier(identifier = nil)
    return nil if identifier.nil?

    Device.find_by(identifier: identifier).try(:id)
  end

  def truck
    device.truck
  end
end
