require 'spec_helper'

describe FakeTime do

  describe 'one offs' do
    before(:each) do
      @start_time = Time.new(2014,1,1,11,0)
      @start_input = @start_time.strftime("%l:%M %p").strip
      @fake_time = FakeTime.parse @start_input
    end
    # "[H]H:MM {AM|PM}"
    it 'can parse time ' do
      @fake_time.hour.should == @start_time.hour
      @fake_time.minutes.should ==@start_time.min
      @fake_time.period.should == @start_time.strftime('%p')
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

    it 'handles 24 hours' do
      validate_time 60 * 24
    end



  end

  describe 'bulk test' do
    it 'handles all' do
      (0..23).each do |hour|
        @start_time = Time.new(2014,1,1,hour,0)
        (1..100000).each do |min|
          @start_input = @start_time.strftime("%l:%M %p").strip
          @fake_time = FakeTime.parse @start_input
          validate_time min

        end
      end
    end
  end
def validate_time min
      time = @start_time + min*60
      expected = time.strftime("%l:%M %p").strip
      @fake_time.add_minutes min
      result = @fake_time.to_s

      result.should eq(expected), "expected #{expected}, got #{result} starting at: #{@start_time.strftime("%l:%M %p").strip} add: #{min} #{min/60}"
    end
end


