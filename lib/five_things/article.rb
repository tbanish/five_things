class FiveThings::Article
  attr_accessor :headline, :body, :source
  
  @@all = []
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def word_count
    @words = self.body.split.size
  end
  
  def word_count_message
    puts "Word Count: #{@words}"
  end
  
end