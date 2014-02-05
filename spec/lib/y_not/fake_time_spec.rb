require 'spec_helper'

describe FakeTime do 
  before(:each) do
    @start_time = Time.new(2014,1,1,1,0)
    @start_input = @start_time.strftime("%l:%M %p").strip
    @fake_time = FakeTime.parse @start_input
  end
  # "[H]H:MM {AM|PM}"
  it 'can parse time ' do 
    @fake_time.hour.should == 1
    @fake_time.seconds.should ==0
    @fake_time.period.should == 'AM'
  end

  it 'should handle no period' do 
    @fake_time = FakeTime.parse '1:00'
  end

  it 'handles simple case ' do 
    validate_time 1
  end

  it 'handles hour crossings ' do 
    validate_time 61
  end
  
  it 'handles midnight ' do 
    validate_time 60*11
  end

  it 'handles 24 hours' do 
    validate_time 60 * 24
  end

  it 'handles 16 hours' do 
    validate_time 60 * 16
  end

  it 'handles 47 hours' do 
    validate_time 60 * 16
  end

  it 'handles 48 hours' do 
    validate_time 48
  end
  
  def validate_time min
    time = @start_time + min*60
    expected = time.strftime("%l:%M %p").strip
    @fake_time.add_minutes min
    @fake_time.to_s.should eq(expected)
  end
    
end