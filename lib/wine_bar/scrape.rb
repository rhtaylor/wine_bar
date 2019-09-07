class Scrape 
    Base = 'http://www.wine.com'
    @@menu = []

    def self.index 
        index_url = Base + "/list/wine/7155?sortBy=savings&pricemax=90"
        doc = Nokogiri::HTML(open(index_url))
        container = doc.css('.prodList')
       wines = container.css('.prodItem')
     wines.each do |wine|
       @@menu << {
       :link => wine.css('.prodItemInfo_link').attribute('href').value,
       :name => wine.css('.prodItemInfo_name').text,
       :rating => wine.css('.averageRating_average').text,
       :price => wine.css('.productPrice_price-saleWhole').text.strip
       } 
       end
       @@menu.each do |item| 
        Bottle.new.create(item)
       end
   end  
    
   def info(link)
    document = Nokogiri::HTML(open(link))
        binding.pry
   end

end