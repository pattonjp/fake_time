require 'spec_helper'

describe YNot do 
  it 'should call fake time' do 
    result = YNot.add_minutes '1:00 AM', 1
    result.should_not be_nil
  end

end