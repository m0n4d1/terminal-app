menu_main = {
  name: "Main menu",
  description: "some details",
  options: [
    "go back",
    "register habits",
    "Diary",
    "metrics",
    "help"
  ]
}

menu_habits = {
  name: "Habits menu",
  description: "some details",
  options: [
    "go back",
    "create habit",
    "edit habit",
    "remove habit",
    "list habits"
  ]
}

menu_diary = {
  name: "Diary menu",
  description: "some details",
  options: [
    "go back",
    "list habbits",
    "roster daily",
    "calandar"
  ]
}

menu_metrics = {
  name: "Metrics menu",
  description: "some details",
  options: [
    "go back",
    "option 1",
    "option 2",
    "option 3"
  ]
}



# "habit tracker"

#INIT
#------------------
#cross-platform clear terminal
clear = Gem.win_platform? ? (system "cls") : (system "clear")
#------------------

def menu_details(menu)

  system "clear"
  print "Welcome to the #{menu[:name]}.\n"
  print "Description: #{menu[:description]}\n"
  menu[:options].each_with_index do |option,i|
    print "#{i}: #{option}, "
  end
  print "\n"
  print "enter a number to make a selection\n"

end

#main loop
loop do
  #print details
  #------------------
  menu_details(menu_main)
  #------------------

  #handle input
  #------------------
  input = gets.strip.chomp.to_i
  case input 
    when 1
      
      loop do
        #Print details
        #------------------
        menu_details(menu_habits)
        #------------------


        #handle input
        #------------------
        input = gets.strip.chomp.to_i
        
        case input
          when 0
            break
          else
            
        end
        #------------------
      end

    when 2

      
      loop do
        #Print details
        #------------------
        clear
        menu_details(menu_diary)
        #------------------

        #handle input
        #------------------

        input = gets.strip.chomp.to_i
        case input 
          when 0
            break
          when 1

          when 2

          when 3

          
          else
            
        end
        #------------------
        
      end


    when 3

      loop do
        #Print details
        #------------------
        menu_details(menu_metrics)
        #------------------

        #handle input
        #------------------

        input = gets.strip.chomp.to_i
        case input 
          when 1

          when 2

          when 3

          when 0
            exit = true
          
          else
            break
        end
        #------------------
      end
    else
      break
  end
  #------------------
end
