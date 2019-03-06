require 'io/console'

class TerminalApp
  
  def initialize
    @cost_goal = 0
    @habits = [
      {
        name: "no coffee",
        cost: 2
      }
    ]
    @menus = {
      main: {
        name: "Main",
        description: "Daily Habit Economiser home screen",
        options: [
          {
            label: "eixt",
            action: "exit"
          },
          {
            label:"register habits",
            action: "open_menu(@menus[:habits])"
          },
          {
            label: "Set Goal",
            action: "set_goal(@menus[:main])"
          },
          {
            label: "metrics",
            action: "open_menu(@menus[:metrics])"
          },
          {
            label: "help/manual",
            action: "print_help(@menus[:main])"
          }
        ]
      },
      habits: {
        name: "Habits",
        description: "some details",
        options: [
          {
            label: "go back",
            action: "open_menu(@menus[:main])"
          },
          {
            label: "create habit",
            action: "create_habit(@menus[:habits])"
          },
          {
            label: "edit habit",
            action: "open_menu(@menus[:habits_edit])"
          },
          {
            label: "remove habit",
            action: 0
          },
          {
            label: "list habits",
            action: "list_habits(@menus[:habits])"
          }
        ]
      },
      habits_create: {
        name: "Create Habit",
        description: "Start a daily habit that saves money",
        options: [
          {
            label: "go back",
            action: "open_menu(@menus[:habits])"
          },
          {
            label: "set name",
            action: "get_name()"

          },
          {
            label: "set cost",
            action: ""
          },
          {
            label: "register habit",
            action: ''
          }
        ]
      },
      diary: {
        name: "Set Goal",
        description: "some details",
        options: [
          "go back",
          "list habbits",
          "roster daily",
          "calandar"
        ]
      },
      metrics: {
        name: "Metrics",
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

  def print_help(prev_menu)
    system "clear"
    print "help details\n"
    print "\n"
    print "press any key to return to go back\n"
    STDIN.getch
    open_menu(prev_menu)
  end

  def set_goal(prev_menu)
    system "clear"
    raw_input = gets.strip.chomp
    if raw_input =~ /\d+/
      input = raw_input.to_i
      if input <= 0
        @cost_goal = input
      else
        set_goal(prev_menu)
      end
    else
      set_goal(prev_menu)
    end

  end
  
  def list_metrics

  end

  def create_habit(prev_menu)
    system "clear"
    print "Enter habit name"
    input = gets.strip.chomp


  end

  def list_habits(prev_menu)

    @habits.each do |habit|
      print "#{habit[:name]} saves $#{habit[:cost]}\n"
    end
    print "\npress any key to return to go back\n"
    STDIN.getch
    open_menu(prev_menu)
  end

  def get_name
    p ""
  end

  def render_menu(menu,invalid_input)
    system "clear"
    if invalid_input
      print "Invalid Input: #{invalid_input}\n"
      print "\n"
    end
    print "Welcome to the #{menu[:name]} menu.\n"
    print "\n"
    print "Description: #{menu[:description]}\n"
    print "\n"
    menu[:options].each_with_index do |option,i|
      print "#{i}: #{option[:label]}\n"
    end
    print "\n"
    print "enter a number to make a selection\n"
  end
  
  def open_menu(menu,invalid_input = nil)
    render_menu(menu,invalid_input)
    
    raw_input = gets.strip.chomp
    if raw_input =~ /\d+/
      input = raw_input.to_i
      if input <= menu[:options].length
        eval(menu[:options][input][:action])
      else
        open_menu(menu,input)
      end
    else
      open_menu(menu,raw_input)
    end

  end

  def init_menu_system
    open_menu(@menus[:main])
  end
end




terminal_app = TerminalApp.new

terminal_app.init_menu_system




