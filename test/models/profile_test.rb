require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  def profile
    @profile ||= Profile.new
  end

  def test_valid
    assert profile.valid?
  end
end
