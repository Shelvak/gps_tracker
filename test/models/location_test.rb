require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = Fabricate(:location)
  end

  test 'create' do
    assert_difference ['Location.count', 'PaperTrail::Version.count'] do
      Location.create! Fabricate.attributes_for(:location)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Location.count' do
        @location.update!(device_id: 975)
      end
    end

    assert_equal 975, @location.reload.device_id
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Location.count', -1) { @location.destroy }
    end
  end

  test 'validates blank attributes' do
    @location.device_id = ''
    @location.coordinates = ''

    assert @location.invalid?
    assert_equal 2, @location.errors.size
    assert_equal_messages @location, :device_id, :blank
    assert_equal_messages @location, :coordinates, :blank
  end

  test 'assign lon and lat' do
    lat = 13.001002
    lon = 17.001002
    @location.lat = lat
    @location.lon = lon
    @location.save!

    assert_equal [lat, lon], @location.reload.coordinates
    assert_equal lat, @location.reload.lat
    assert_equal lon, @location.reload.lon
  end
end
