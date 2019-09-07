class Cli 

    def run 
        view  
    end

    def view 
        input = ''
        while input != 0 
        puts "                 "
        puts "================="
        puts "   W   I   N   E "
        puts "      B  A  R    "
        puts "================="
        puts "                 "
        puts "type 1 for list of wine"
        puts "type 0 to exit "
        input = gets.chomp.to_i
        
        if input == 1 
            menu 
        elsif input == 0
            exit 
        end
        end 
    end 

    def menu 
       Scrape.index
       Bottle.list
    end
    def exit 
        puts <<-DOC 
        well that was fun 
         dont code drunk
        Thank you for checking out 
         my first cli program 
        DOC
    end

end