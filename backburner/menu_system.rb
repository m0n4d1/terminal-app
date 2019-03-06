class Menu 

  def menu_details(menu)
    system "clear"
    print "Welcome to the #{menu.menu[:name]}.\n"
    print "Description: #{menu.menu[:description]}\n"
    menu[:options].each_with_index do |option,i|
      print "#{i}: #{option[:label]}, "
    end
    print "\n"
    print "enter a number to make a selection\n"
  end
  
  def open_menu(menu)
    loop do
  
      menu_details(menu)
      
      input = gets.strip.chomp.to_i
      if input == 0
        break
      elsif input <= menu.menu[:options].length
        menu.menu[:options][input][:action]

      else
        
      end
    end
  
  end

  # def init_menu_system
  #   open_menu(@menus[:main])
  # end
end

class MainMenu < Menu
  attr_reader :menu
  def initialize  
    @menu = {
      name: "Main menu",
      description: "some details",
      options: [
        {
          label: "go back",
          action: 0
        },
        {
          label:"register habits",
          action: HabitsMenu.new
        },
        {
          label: "Diary",
          action: 0
        },
        {
          label: "metrics",
          action: 0
        },
        {
          label: "help",
          action: 0
        }
      ]
    }
  end
end

class HabitsMenu < Menu
  attr_reader :menu
  def initialize
    @menu = {
      name: "Habits menu",
      description: "some details",
      options: [
        {
          label: "go back",
          action: nil
        },
        {
          label: "create habit",
          action: nil
        },
        {
          label: "edit habit",
          action: nil
        },
        {
          label: "remove habit",
          action: nil
        },
        {
          label: "list habits",
          action: nil
        }
      ]
    }
  end
end

init_menu_system = Menu.new.open_menu(MainMenu.new)