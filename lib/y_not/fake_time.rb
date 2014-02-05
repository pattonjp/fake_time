class FakeTime
  attr_accessor :hour, :seconds, :period

  def initialize hour, sec, period
    @hour = hour
    @seconds = sec
    @period = period.upcase if period
  end

  def self.parse str_time
    time, period = str_time.split(' ')
    hour, sec = time.split(':')
    new hour.to_i, sec.to_i, period
  end

  def add_minutes num
    raise Eception "Time only goes forward here...." unless num > 0
    new_seconds = num + seconds
    add_hours =  new_seconds / 60
    @seconds = new_seconds % 60
    spins = add_hours / 12
    
    if spins.odd? || (add_hours + @hour) == 12
      new_period = ['AM','PM'] - [@period]
      @period = new_period.first     
    end
    @hour += add_hours % 12
  end

  def to_s
    pad_seconds ="0"if seconds.to_s.size < 2
    "#{hour}:#{pad_seconds}#{seconds} #{period}"
  end

end