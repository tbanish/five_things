class FiveThings::CLI
  
  def call
    greeting
    list
  end
  
  def greeting
    puts <<~MESSAGE
    Welcome to the Five Things app!
    
    Here you can find the top five news stories of the week
    to help you stay informed in a fast effient way!
    
    MESSAGE
  end
  
  def list
    puts <<~LIST
    Please select an item form the list below:
    
    1. Article 1
    2. Article 2
    3. Article 3
    4. Article 4
    5. Article 5
    6. Exit
    
    LIST
    
    @user_input = gets.strip
    
    if (1..5).include?(@user_input.to_i)
      show_article
    elsif @user_input.to_i == 6
      puts "See you next time!"
    else
      puts "I'm not sure what you meant ..."
      list
    end
  end
  
  def show_article
    puts "Article"
    option_message
  end
  
  def option_message
    puts "What would you like to do next?"
    puts "1. See list of articles"
    puts "2. Exit"
    
    @user_input = gets.strip
    
    if @user_input.to_i == 1
      list
    elsif @user_input.to_i == 2
      puts "Come back again soon!"
    else
      puts "I'm not quite sure what you mean ..."
      option_message
    end
  end

  
end