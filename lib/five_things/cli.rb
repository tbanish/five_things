class FiveThings::CLI
  def call
    FiveThings::Scraper.new.scrape_articles
    greeting
    menu
  end
  
  def greeting
    puts <<~MESSAGE
    Welcome to the Five Things app!
    
    Here you can find the top five news stories of the week
    to help you stay informed in a fast efficient way!
    
    MESSAGE
  end
  
  def menu
    puts "---------"
    puts "Main Menu"
    puts "---------"
    puts "Please select an item from the list below"
    puts "Type 1-5 to choose which article you would like to view"
    puts "Type 'e' to exit:"
    puts ""
    article_list
  end
  
  def article_list
    FiveThings::Article.all.each.with_index(1) do |article, i|
      puts "#{i}. #{article.headline}"
    end
    
    @list_input = gets.strip
    
    if @list_input.downcase == 'e'
      puts "See you next time!"
      exit
    elsif (1..5).include?(@list_input.to_i)
      show_article
    else
      puts "I'm not sure what you meant.  Let's try that again ..."
      puts ""
      sleep(2)
      menu
    end
  end

  def input_to_index(input)
    input.to_i - 1
  end
  
  def show_article
    @article = FiveThings::Article.find_by_index(input_to_index(@list_input))
    
    puts "** #{@article.headline} **"
    puts ""
    puts "Word Count: #{@article.word_count}"
    puts ""
    puts "#{@article.body}"
    puts ""
    puts "Source: #{@article.source}"
    puts "------"
    puts ""
    
    @timer = FiveThings::Timer.new
    @timer.start
    finished_reading?
  end
  
  def finished_reading?
    puts "Type 'y' and press 'enter' when finished reading."
    
    @finished_reading_input = gets.strip
  
    case @finished_reading_input.downcase
    when 'y', 'yes'
      @timer.stop
      @timer.convert
      
      puts "It took you #{@timer.minutes} minute(s) and #{@timer.seconds} second(s) to finish this article."
      puts "That means your reading speed is approximately #{@timer.reading_speed(@article.word_count)} wpm."
      puts "Great Job!"
      puts ""
      
      option_message
    else
      puts "I'm not sure what you meant. Let's try that again ..."
      puts ""
      sleep(2)
      finished_reading?
    end
  end
  
  def option_message
    puts "Would you like to view the list of articles again? (y/n)"

    @option_input = gets.strip
    
    case @option_input.downcase
    when 'y', 'yes'
      menu
    when 'n', 'no'
      farewell
    else
      puts "I'm not sure what you meant. Let's try that again ..."
      puts ""
      sleep(2)
      option_message
    end
  end
  
  def farewell
    puts "Come back again soon!"
    exit
  end
end