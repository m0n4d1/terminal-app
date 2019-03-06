menu_main =  "habit tracker"
menu_habbits = "habits menu"
menu_diary = "diary menu"
menu_metrics = "metrics menu"

#INIT
#------------------
#cross-platform clear terminal
clear = Gem.win_platform? ? (system "cls") : (system "clear")
#------------------

def menu_description(name)
  print "Welcome to the #{name}.\n"
  print "Description: \n"
  print "1: register habbits, 2: Diary, 3: metrics, 4: help \n0: return\n"
  print "enter a number to make a selection\n"
end

#main loop
loop do
  #print details
  #------------------
  print "Welcome to the #{menu_main}.\n"
  print "Description: \n"
  print "1: register habbits, 2: Diary, 3: metrics, 4: help \n0: return\n"
  print "enter a number to make a selection\n"
  #------------------

  #handle input
  #------------------
  input = gets.strip.chomp.to_i
  case input 
    when 1
      
      loop do
        #Print details
        #------------------
        clear
        print "welcome to the #{menu_habbits}\n"
        print "Descritpion: here you can edit and create your habbits\n"
        print "enter a number to make a selection\n"
        print "1: new habbit, 2: edit habbit, 3: list habbits \n0: return\n"
        #------------------


        #handle input
        #------------------
        input = gets.strip.chomp.to_i
        
        case input
          when 0
            
          else
            break
        end
        #------------------
      end

    when 2

      
      loop do
        #Print details
        #------------------
        clear
        print "welcome to the #{menu_diary}\n"
        print "Descritpion: here you can edit and create your habbits\n"
        print "enter a number to make a selection\n"
        print "1: todays habbits, 2: checkout, 3: calandar \n0: return\n"
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


    when 3

      loop do
        #Print details
        #------------------
        clear
        print "welcome to the #{menu_metrics}\n"
        print "Descritpion: view metrics\n"
        print "enter a number to make a selection\n"
        print "1: todays habbits, 2: checkout, 3: calandar \n0: return\n"
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

    else
      break
  end
  #------------------
end