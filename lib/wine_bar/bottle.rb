class Bottle 
   attr_accessor :link, :name, :price, :rating, :index
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
    
    def self.make_list
        @@numbered_list = @@bottles.sort{ |x,y| x.price <=> y.price}.map.with_index(1) do 
             |w,i| w.index = i  
             w
     end
    
    end

    def self.list 
            @@numbered_list
     end 
    def self.find_by_input(input)
        a = @@numbered_list.find{ |wine| wine.index == input}
        
    end

    

end

