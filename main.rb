class MenuController
  attr_reader :menus
  
  def initialize
    @menus = {
      main: {
        name: "Main menu",
        description: "some details",
        options: [
          {
            label: "go back",
            action: 0
          },
          {
            label:"register habits",
            action: open_menu(@menus[:habits])
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
      },
      habits: {
        name: "Habits menu",
        description: "some details",
        options: [
          "go back",
          "create habit",
          "edit habit",
          "remove habit",
          "list habits"
        ]
      },
      diary: {
        name: "Diary menu",
        description: "some details",
        options: [
          "go back",
          "list habbits",
          "roster daily",
          "calandar"
        ]
      },
      metrics: {
        name: "Metrics menu",
        description: "some details",
        options: [
          "go back",
          "option 1",
          "option 2",
          "option 3"
        ]
      }
    }
  end

  def menu_details(menu)
    system "clear"
    print "Welcome to the #{menu[:name]}.\n"
    print "Description: #{menu[:description]}\n"
    menu[:options].each_with_index do |option,i|
      print "#{i}: #{option[:label]}, "
    end
    print "\n"
    print "enter a number to make a selection\n"
  end
  
  def open_menu(menu)
    loop do
  
      # menu_details(menu)
      
      input = gets.strip.chomp.to_i
      if input == 0
        break
      elsif input <= menu[:options].length
        menu[:options][input][:action]
      else
        
      end
    end
  
  end

  def init_menu_system
    open_menu(@menus[:main])
  end
end

menu_controller = MenuController.new


menu_controller.init_menu_system




