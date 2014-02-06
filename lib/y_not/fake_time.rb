class FakeTime
  attr_accessor :hour, :minutes, :period

  def initialize hour, minutes, period
    @hour = hour
    @minutes = minutes 
    @period = period.upcase if period
  end

  def self.parse str_time
    @str_time = str_time.strip
    time, period = str_time.split(' ')
    hour, minutes = time.split(':')
    new hour.to_i, minutes.to_i, period
  end

  def add_minutes num
    raise Eception "Time only goes forward here...." unless num > 0
    new_minutes = num + minutes
    add_hours =  new_minutes / 60
    addl_minutes = new_minutes % 60
    new_hour = add_hours % 12
    spins =0 
    
    period_crosses = num/60/12 
    spins += period_crosses
    if hour != 12 && period_crosses == 0
      spins = (hour+ new_hour) >= 12 ? 1 : 0 
    end
    
    if spins.odd? 
      @period = (['AM','PM'] - [@period]).first
    end
    @minutes = addl_minutes
    @hour += new_hour
    if @hour > 12 
      @hour -= 12
    end
    self
  end

  def to_s
    pad_minutes ="0"if minutes.to_s.size < 2
    "#{hour}:#{pad_minutes}#{minutes} #{period}"
  end

end