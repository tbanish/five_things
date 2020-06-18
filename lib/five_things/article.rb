class FiveThings::Article
  attr_accessor :headline, :body, :source
  
  @@all = []
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find_by_index(index)
    self.all[index]
  end

  def word_count
    @words = self.body.split.size
  end
  
  def word_count_message
    puts "Word Count: #{self.word_count}"
  end
end