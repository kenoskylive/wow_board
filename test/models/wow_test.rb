require "test_helper"

class WowTest < ActiveSupport::TestCase
  def wow
    @wow ||= Wow.new
  end

  def test_valid
    assert wow.valid?
  end
end
