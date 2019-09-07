class Bottle 
   attr_accessor :link, :name, :price, :rating
    @@bottles = []

    def create(hash) 
       hash.each do |key, words| 
        self.send(("#{key}="), words )
       end
    save
    end
       
    
       def save 
        @@bottles << self 
       end
    
    def self.list 
        @@bottles.sort{ |x,y| x.price <=> y.price}.each.with_index(2) do |item, index| 
            puts "#{index}) #{item.name} #{item.price}" 
            
        end 
           puts <<-DOC 

                
                type the number 
                befor the ")"
                for deeper information
                about the wine
                   DOC
    end 
    

end

