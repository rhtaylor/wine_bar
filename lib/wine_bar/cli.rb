class Cli 

    def run
        puts 'loading from cyberspace'
        
        Scrape.index
        Bottle.make_list
        controller  
    end

    def controller
        input = ''
        response = ''
        puts '                       '
        view
        while input != 11
        response = gets.chomp.to_i
        input = "#{response}11".to_i 
        if input == 111
            menu 
        elsif input == 11
            exit 
        elsif input > 0 && input < 26 
            find_by_input(input)
        elsif input != 0 && input != 111
             error_1
        end 
    end 
end 

    def view 
        puts "welcome to the wine bar"
        puts "================="
        puts "   W   I   N   E "
        puts "      B  A  R    "
        puts "================="
        puts "                 "
        puts "type 1 for list of wine"
        puts "                       "
        puts "type 0 to exit "
    end


    def menu 
       wines = Bottle.list   
            second_input = ''                                     
            while second_input != 0 
            
            
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
            second_input = 0
            
        elsif second_input > 25 && second_input != 101
             error_1  
        end
            end 
       puts     <<-DOC 
                the the wine number again
                    for winemaker notes
       
                   DOC
    end
    def find_by_input(input)
        while input != 0
       selection = Bottle.find_by_input(input) 
       
        puts "NAME: #{selection.name}" 
        puts "PRICE: $#{selection.price}"
        puts "RATING: #{selection.rating}"
        puts "________________________________________"        
        puts "           type #{input} again          "
        puts "           for more info                "
        puts "           provided by the winemaker    "
        # reseting input and extending user control functionality 
            third_input = ''
            
            third_input = gets.chomp.to_i 
            
       if   third_input == selection.index
        
            response = Scrape.scrape_page(selection)
            view_2(response, third_input)
       elsif  input == 0
            exit 
       end
    end
        
    end 
    def view_2(response, old_input)
        
        next_input = ''
        while next_input != 0
        puts "Alcohol Percent: #{response.alcohol_percent}" 
        puts "Winemaker Notes: #{response.winemaker_notes}"
        puts "                                            "
        puts "Type #{old_input} again for more!!"
        
        next_input = gets.chomp.to_i
        
        if next_input == old_input
            input = 0
            next_input = 0
            # refacort as it puts out 88 again and should not. Also 0 is not exiting with correct behavior
            # refactor so looking for "#{input}"1 to prevent the recall of input
            more(response)
            
        end
    end
    end
 
    def more(response)
        puts response.more 
        puts menu
    end

        
    def error_1
             puts "    WHOA coder    "
             puts "type a better number!" 
    end

    def exit 
        puts <<-DOC 
        well that was fun 
        Thank you for checking out 
        my first cli program 
        DOC
    end

end 