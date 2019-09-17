class Custom_error < StandardError
    def message 
        
        <<-DOC
         Internet connection too slow right now!
         Please take this time to spend with your loved ones!
         Come back later for more scraping    
        DOC
    end
     
 end