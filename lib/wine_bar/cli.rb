class Cli 

    def run

        puts 'loading from cyberspace'
        # goes to site for scraping. 
        Scrape.index
        #goes to Bottle class to create Bottle instance objects
        Bottle.make_list
        #calls first part of user display and interaction
        controller  
    end
    # instance method inputs drys out the code here and in deeper in program
    def inputs 
        intake = gets.chomp 
        number = Bottle.list.count.to_s
        if  intake == '0' || intake == '101'|| ('1'..number).include?(intake) 
        input = intake.to_i 
        input
        elsif intake == 'r'
            rating(intake) 
        elsif
            puts '+++++++++++++++++++++++++++++++++'
            puts 'type in a valid number please'
            puts '+++++++++++++++++++++++++++++++++'
            inputs
        end
    end
    #code is very dry as this method is used many times 
    def control_flow(var)
        
        if var == 101
            price = Bottle.list
            menu(price) 
        elsif var == 0 
            exit 
        elsif (var > 0) && var <= Bottle.list.count
            find_by_input(var)
        elsif var != 0 && var != 101 && var > Bottle.list.count
             error_1
        end  
    end

    def rating(intake)
        rated = Bottle.list.sort{ |a,b| b.rating <=> a.rating }
        menu(rated)
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
        puts "type 101 for numbered list of wines"
        puts "                                     "
        puts "type a number from 1 to #{Bottle.list.count} for info on a wine"
        puts "                                     "
        puts 'type r to list by rating'
        puts '                        '
        puts "type 0 to exit" 
        
        # by nature of the to_i method a check was put in place 
        # to ensure the user did not accidently type in a sting
        # that would be converted to 0 and cause the program to exit
        # much of the code here and in the future was put in 
        # to ensure user ease and make the code more robust 
    
        input = inputs
        control_flow(input)
        end
end 

    def menu(wines = price)
            
            second_input = ''
            unless second_input == 0 
            puts "<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>"
            puts "type the corresponding number to view more wine info"
            puts "__________________________________________________________________"
                  wines.each do |wine|
            puts "#{wine.index}) #{wine.name} #{wine.price}"
                  end
            second_input = inputs
            control_flow(second_input)
        
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
            method_input = inputs
            
       if   method_input == selection.index
        
            response = Page.pages_find_or_create(selection)
                
            view_2(response, method_input)

       else 
            control_flow(method_input)
        
        
         
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
        
        next_input = inputs
        
        if next_input == old_input
            more(response)
        else 
            control_flow(next_input)
    end
    end
    end
    def more(response)
        puts "Name: #{response.name}"
        puts "Origin: #{response.origin}"
        puts "A narrative on the wine:"
        puts response.more
        puts response.winemaker_notes 
        puts "_________________________________" 
        puts "      no additional info"
        puts "  you can choose another wine"
        price = Bottle.list
        menu(price)
        
    end

        
    def error_1
             puts "________ALERT________"
             puts "      WHOA coder     "
             puts "type a smaller number!"
             puts '______________________' 
             
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