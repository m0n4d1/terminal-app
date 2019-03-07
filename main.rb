require 'io/console'

class TerminalApp
  
  def initialize
    @cost_goal = 0
    @habits = []
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
            label: "Metrics",
            action: "list_metrics(@menus[:main])"
          },
          {
            label: "help/manual",
            action: "print_help(@menus[:main])"
          }
        ]
      },
      habits: {
        name: "Habits",
        description: "Here you can add and edit habits",
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
            label: "remove habit",
            action: "remove_habit(@menus[:habits])"
          },
          {
            label: "list habits",
            action: "list_habits(@menus[:habits])"
          }
        ]
      }
    }
  end

  def remove_habit(prev_menu,invalid_input = nil)
    system "clear"
    if invalid_input
      print "Invalid Input: #{invalid_input}\n"
      print "\n"
    end
    print "select a habit to remove\n"
    print "\n"
    print "0: go back\n"
    print "\n"
    @habits.each_with_index do |habit,i|
      print "#{i + 1}: #{habit[:name]}\n"
    end
    print "\n"
    print "enter a number to make a selection\n"
    raw_input = gets.strip.chomp
    if raw_input =~ /\d+/
      input = raw_input.to_i
      if input <= @habits.length + 1
        @habits.each_with_index do |habit,i|
          if i == input - 1
            @habits.delete(habit)
            break
          end
        end
        open_menu(prev_menu)
      else
        remove_habit(prev_menu,input)
      end
      
    else
      remove_habit(prev_menu,raw_input)
    end
  end

  def print_help(prev_menu)
    system "clear"
    print "help details\n"
    print "\n"
    print "press any key to go back\n"
    STDIN.getch
    open_menu(prev_menu)
  end

  def set_goal(prev_menu)
    system "clear"
    print "Set goal size\n"
    print "Enter a dollar amount\n"
    raw_input = gets.strip.chomp
    if raw_input =~ /\d+/
      input = raw_input.to_i
      if input >= 0
        @cost_goal = input
        open_menu(prev_menu)
      else
      end
    else
      set_goal(prev_menu)
    end
  end
  
  def list_metrics(prev_menu)
    system "clear"

    if @cost_goal > 0 && @habits.length > 0
      total_daily_savings = 0
      @habits.each do |habit|
        total_daily_savings += habit[:cost]
      end
      days = @cost_goal / total_daily_savings
      print "Sticking to your daily habits you can achieve you goal of saving #{@cost_goal} in #{days.round(1)}days\n"
      print "press any key to go back\n"
      STDIN.getch
      open_menu(prev_menu)
    else
      print "please set a Goal or register a Habit\n"
      print "press any key to go back\n"
      STDIN.getch
      open_menu(prev_menu)
    end
  end

  def create_habit(prev_menu)
    hsh = {}
    system "clear"
    print "Enter habit name\n"
    input = gets.strip.chomp
    hsh[:name] = input
    print "How many dollars will this habit save you(daily)?\n"
    raw_input = gets.strip.chomp
    if raw_input =~ /[+-]?([0-9]*[.])?[0-9]+/
      input = raw_input.to_f.round(2)
      hsh[:cost] = input
      @habits.push(hsh)
      open_menu(prev_menu)
    else
      print "Invalid Input: #{raw_input}\n"
      print "Please enter a number (eg. 5, 12.50)"
      print "press any key to go back\n"
      STDIN.getch
      open_menu(prev_menu)
    end

  end

  def list_habits(prev_menu)
    system "clear"
    if @habits.length > 0
      @habits.each do |habit|
        print "Habit: #{habit[:name]} saves you $#{habit[:cost]} a day\n"
      end
    else
      print "No habits registered\n"
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