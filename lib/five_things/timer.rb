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
    @minutes = self.total_in_seconds / 60
    @seconds = self.total_in_seconds % 60
  end
  
  def total_in_seconds
    @total_time_in_seconds = self.difference
  end
  
  def reading_speed(word_count)
    speed = (word_count/self.total_in_seconds) * 60
    speed.round
  end

  def minutes
    @minutes.round
  end

  def seconds
    @seconds.round
  end
end