class Cli 

    def run
        puts 'welcome to the wine bar'
        Scrape.index
        Bottle.make_list
        controller  
    end

    def controller
        input = ''
        while input != 0 
        puts "                 "
        puts "================="
        puts "   W   I   N   E "
        puts "      B  A  R    "
        puts "================="
        puts "                 "
        puts "type 1 for list of wine"
        puts "                       "
        puts "type 0 to exit "
        input = gets.chomp.to_i
        
        if input == 1 
            menu 
        elsif input == 0
            exit 
        elsif input > 1 && input < 26 
            find_by_input(input)
        elsif input > 26 
             puts "type a smaller number!!"
        end 
    end 
end
    def menu 
       wines = Bottle.list
       
            puts "<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>"
            puts "type the corresponding number to view more wine info"
            puts "____________________________________________________"
         wines.each do |wine|
            puts "#{wine.index}) #{wine.name} #{wine.price}"
            puts <<-DOC 
                            the the wine number again
                            for winemaker notes
                            
                    DOC
       end 
    end
    def find_by_input(input)
        Bottle.find_by_input(input)
        
    end 
    

    def exit 
        puts <<-DOC 
        well that was fun 
         
        Thank you for checking out 
         my first cli program 
        DOC
    end

end