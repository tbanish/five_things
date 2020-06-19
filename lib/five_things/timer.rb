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
    @total_time_in_seconds = self.difference.round
    @minutes = @total_time_in_seconds.round / 60
    @seconds = @total_time_in_seconds.round % 60
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