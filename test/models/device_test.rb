require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  def setup
    @device = Fabricate(:device)
  end

  test 'create' do
    assert_difference ['Device.count', 'PaperTrail::Version.count'] do
      Device.create! Fabricate.attributes_for(:device)
    end
  end

  test 'update' do
    assert_difference 'PaperTrail::Version.count' do
      assert_no_difference 'Device.count' do
        @device.update!(identifier: 'Updated')
      end
    end

    assert_equal 'Updated', @device.reload.identifier
  end

  test 'destroy' do
    assert_difference 'PaperTrail::Version.count' do
      assert_difference('Device.count', -1) { @device.destroy }
    end
  end

  test 'validates blank attributes' do
    @device.identifier = ''
    @device.truck_id = ''

    assert @device.invalid?
    assert_equal 2, @device.errors.size
    assert_equal_messages @device, :identifier, :blank
    assert_equal_messages @device, :truck_id, :blank
  end
end
