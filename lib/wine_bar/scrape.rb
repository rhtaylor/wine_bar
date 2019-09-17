class Scrape 
    BASE = 'http://www.wine.com'
    @@all = []
    @@pages = []
    def self.open_page(index_url)
      return doc =  Nokogiri::HTML(open(index_url))
          rescue Net::OpenTimeout => e 
            raise Custom_error, e.message
          rescue SocketError => e 
            raise Custom_error, e.message
    end
    def self.index
        index_url = BASE + "/list/wine/7155?sortBy=savings&pricemax=90"
        doc = open_page(index_url)
       

        container = doc.css('.prodList')
        wines = container.css('.prodItem')
        wines.each do |wine|
       @@all << {
       :link => wine.css('.prodItemInfo_link').attribute('href').value,
       :name => wine.css('.prodItemInfo_name').text,
       :rating =>  (wine.css('.averageRating_average').text.to_i) > 0  ? (wine.css('.averageRating_average').text) : 'no rating',
       :price => wine.css('.productPrice_price-saleWhole').text.strip
       } 

       end
       @@all.each do |item| 
        Bottle.new.create(item)
       end
   
   end  

   def self.scrape_page(wine_obj)
    
    wine_link = wine_obj.link 
    
    individual_page = BASE + wine_link
    docu = Nokogiri::HTML(open(individual_page))

    more = docu.css('.viewMoreModule_text')
    
    @@pages << { 
    :obj => wine_obj,
    :name => docu.css('.pipName').text,
    :alcohol_percent => docu.css('.mobileProdAttrs').css('.prodAlcoholPercent').css('.prodAlcoholPercent_percent').text,
    :price => docu.css('span.productPrice_price-saleWhole').text,
    :origin => docu.css('span.prodItemInfo_originText a').text, 
    :winemaker_notes => docu.css('.viewMoreModule_text').first.text,
        
    :more => more[2].text,
    :rating => docu.css('span.averageRating_average').first.text
    }
    
    Page.create_obj( @@pages.last )
   end
def self.pages 
    @@pages 
end
end