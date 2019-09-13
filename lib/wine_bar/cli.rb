class Cli 

    def run
        puts 'loading from cyberspace'
        
        Scrape.index
        Bottle.make_list
        controller  
    end

    def controller
        input = ''
        unless input == 0
        puts '                       '
        puts "welcome to the wine bar"
        puts "================="
        puts "   W   I   N   E "
        puts "      B  A  R    "
        puts "================="
        puts "                 "
        puts "type 101 for list of wine"
        puts "                       "
        puts "type 0 to exit "
        input = gets.chomp.to_i
        
        if input == 101
            menu 
        elsif input == 0 
            exit 
        elsif input > 0 && input < 26 
            find_by_input(input)
        elsif input != 0 && input != 101
             error_1
        end 
    end 
end 

    def menu 
           wines = Bottle.list   
            second_input = '' 
            unless second_input == 0 
            puts "<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>"
            puts "type the corresponding number to view more wine info"
            puts "__________________________________________________________________"
                  wines.each do |wine|
            puts "#{wine.index}) #{wine.name} #{wine.price}"
                  end
            second_input = gets.chomp.to_i 
        if second_input > 0 && second_input < 26 
            find_by_input(second_input)
        elsif second_input == 0 
            exit
        elsif second_input > wines.count && second_input != 0
             error_1  
        end
    end 
       
    end
    def find_by_input(method_input)
        unless method_input == 0
        selection = Bottle.find_by_input(method_input) 
       
        puts "NAME: #{selection.name}" 
        puts "PRICE: $#{selection.price}"
        puts "RATING: #{selection.rating}"
        puts "________________________________________"        
        puts "           type #{method_input} again          "
        puts "           for more info                "
        puts "           provided by the winemaker    "
        # reseting input and extending user control functionality 
            method_input = gets.chomp.to_i 
            
       if   method_input == selection.index
        
            response = Scrape.scrape_page(selection)
                
            view_2(response, method_input)

       elsif  method_input != 0 && method_input != selection.index && !(method_input > Bottle.list.count)
            find_by_input(method_input)
       elsif method_input > Bottle.list.count && method_input != 101 
            error_1
       elsif method_input == 0 
        
        exit 
         
       end
    end
        
    end 
    def view_2(response, old_input)
        
        next_input = ''
        unless next_input == 0
        puts "Alcohol Percent: #{response.alcohol_percent}" 
        puts "Winemaker Notes: #{response.winemaker_notes}"
        puts "                                            "
        puts "Type #{old_input} again for more!!"
        
        next_input = gets.chomp.to_i
        
        if next_input == old_input
            more(response)
        elsif  next_input != 0 && next_input != old_input && !(next_input > 25)
              find_by_input(next_input)
        elsif next_input > Bottle.list.count && next_input != 101 
            error_1      
        end
    end
    end
 
    def more(response)
        puts response.more
        puts response.winemaker_notes 
        puts "_________________________________" 
        puts "      no additional info"
        puts "  you can choose another wine"
        menu
    end

        
    def error_1
             puts "________ALERT________"
             puts "      WHOA coder     "
             puts "type a smaller number!"
             puts '______________________' 
             menu
    end

    def exit 
        puts <<-DOC 
        well that was fun 
        Thank you for checking out 
        my first cli program 
        DOC
        input = 0 
        next_input = 0
        old_input = 0
        second_input = 0
        method_input = 0 
        
    end

end 