class FiveThings::Timer
  def start
    @start_timer = Time.now
  end

  def stop
    @stop_timer = Time.now
  end

  def difference
    @difference = @stop_timer - @start_timer
  end
  
  def convert
    split = (self.difference/60).round(2).to_s.split(".")
    @minutes = split[0]
    @seconds = ("0.#{split[1]}".to_f*60).round
  end
  
  def total_in_seconds
    (self.minutes.to_f*60) + self.seconds.to_f
  end
  
  def reading_speed(word_count)
    speed = (word_count/self.total_in_seconds) * 60
    speed.round
  end

  def minutes
    @minutes
  end

  def seconds
    @seconds
  end
end