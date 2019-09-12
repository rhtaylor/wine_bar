class Scrape 
    Base = 'http://www.wine.com'
    @@menu = []
    @@pages = []
    def self.index
        index_url = Base + "/list/wine/7155?sortBy=savings&pricemax=90"
        
            
        if   doc = Nokogiri::HTML(open(index_url))
        
        

        container = doc.css('.prodList')
        wines = container.css('.prodItem')
        wines.each do |wine|
       @@menu << {
       :link => wine.css('.prodItemInfo_link').attribute('href').value,
       :name => wine.css('.prodItemInfo_name').text,
        :rating =>  (wine.css('.averageRating_average').text.to_i) > 0  ? (wine.css('.averageRating_average').text) : 'no rating',
       :price => wine.css('.productPrice_price-saleWhole').text.strip
       } 

       end
       @@menu.each do |item| 
        Bottle.new.create(item)
       end
    else  
        begin
         raise Custom_error
         rescue Custom_error => error
          puts error.message 
         end
        end
   end  

   def self.scrape_page(wine_obj)
    
    wine_link = wine_obj.link 
    
    individual_page = Base + wine_link
    docu = Nokogiri::HTML(open(individual_page))
    y = docu.css('.viewMoreModule_text')
    more = docu.css('.viewMoreModule_text')
    
    @@pages << { 
    :obj => wine_obj,
    :name => docu.css('.pipName').text,
    :alcohol_percent => docu.css('.mobileProdAttrs').css('.prodAlcoholPercent').css('.prodAlcoholPercent_percent').text,
    :price => docu.css('span.productPrice_price-saleWhole').text,
    :origin => docu.css('span.prodItemInfo_originText a').text, 
    :winemaker_notes => docu.css('.viewMoreModule_text').first.text,
        
    :more => y[2].text,
    :rating => docu.css('span.averageRating_average').first.text
    }
    
    Page.create_find_by_name( @@pages.last )
   end
def self.pages 
    @@pages 
end
end