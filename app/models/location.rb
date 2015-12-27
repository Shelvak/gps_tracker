class Location < ActiveRecord::Base
  has_paper_trail

  validates :coordinates, :device_id, :taken_at, presence: true

  def initialize(attributes = nil)
    super(attributes)

    self.taken_at ||= Time.zone.now
  end

  def lat
    self.coordinates.first
  end

  def lon
    self.coordinates.last
  end

  def lat=(value)
    _coor = self.coordinates
    _coor[0] = value
    self.coordinates = _coor
  end

  def lon=(value)
    _coor = self.coordinates
    _coor[1] = value
    self.coordinates = _coor
  end
end
