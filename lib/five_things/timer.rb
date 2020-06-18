class Timer
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

  def minutes
    @minutes
  end

  def seconds
    @seconds
  end
  
  def results
    puts "It took you #{@minutes} minute(s) and #{@seconds} second(s) to finish this article."
    puts ""
  end
end