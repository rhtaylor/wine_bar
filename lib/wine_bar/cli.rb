class Cli 

    def run
        puts 'loading from cyberspace'
        
        Scrape.index
        Bottle.make_list
        controller  
    end

    def controller
        input = ''
        puts '                       '
        view
        while input != 0 
        input = gets.chomp.to_i
        
        if input == 111
            menu 
        elsif input == 0
            exit 
        elsif input > 0 && input < 26 
            find_by_input(input)
        elsif input > 25 && input != 101
             error_high
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
        puts "type 111 for list of wine"
        puts "                       "
        puts "type 0 to exit "
    end


    def menu 
       wines = Bottle.list
       
            puts "<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>"
            puts "type the corresponding number to view more wine info"
            puts "__________________________________________________________________"
                  wines.each do |wine|
            puts "#{wine.index}) #{wine.name} #{wine.price}"
            
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
            input = ''
        
            input = gets.chomp.to_i 
       if   input == selection.index 
            response = Scrape.scrape_page(selection)
            view_2(response, input)
       elsif  input == 0
            exit 
       end
    end
        
    end 
    def view_2(response, input)
        
        while input != 0
        puts "Alcohol Percent: #{response.alcohol_percent}" 
        puts "Winemaker Notes: #{response.winemaker_notes}"
        puts "                                            "
        puts "Type #{input} again for more!!"
        input = ''
        input = gets.chomp.to_i
        if input == response.obj.index 
            # refacort as it puts out 88 again and should not. Also 0 is not exiting with correct behavior
            puts response.more
        elsif input == 0
            exit
        end
    end
    end
    def     
    def error_high
             puts "    WHOA too high    "
             puts "type a smaller number!!" 
    end

    def exit 
        puts <<-DOC 
        well that was fun 
        Thank you for checking out 
        my first cli program 
        DOC
    end

end 