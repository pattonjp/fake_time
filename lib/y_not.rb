require "y_not/version"
require 'y_not/fake_time'
module YNot
  def self.add_minutes time_string, minutes
    fake_time = FakeTime.parse time_string
    fake_time.add_minutes minutes
    fake_time.to_s
  end
end
