class FiveThings::Scraper
  
  def scrape_articles
    site = "https://theweek.com/5things"
    doc = Nokogiri::HTML(open(site))
    
    doc.search("div.five-things-item").each do |a|
      article = FiveThings::Article.new
      article.headline = a.search("div.five-things-headline p").text
      article.body = a.search("div.five-things-body p").text
      article.source = a.search("span.source").first.text.gsub("\t", "").gsub("\n", "")
      article.save
    end
  end
  
  
end