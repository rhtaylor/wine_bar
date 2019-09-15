class Page 
   attr_accessor :alcohol_percent, :price, :name, :origin, :winemaker_notes, :rating, :more, :obj
    @@web_pages = [] 

    def self.create_obj(hash)
    
    if answer = @@web_pages.find{ |obj| obj.name == hash[:name]} 
        answer 
    else
        self.new.create(hash)
        
    end 
    end
    
    def create(hash)
    hash.each do |key, value|
        self.send(("#{key}="), value) 
        end 
    save
    view_more
    end
    def view_more 
        @@web_pages.last
    end

def save 
    @@web_pages << self 
end
def self.pages_find_or_create(input) 
    if response = @@web_pages.find{ |item| item.name == input.name}
        response
else 
    Scrape.scrape_page(input)
end 
end

end