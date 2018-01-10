require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    # here we display the main menu options to the command line
    p "Main Menu - #{address_book.entries.count} entries"
    p "1 - View all entries"
    p "2 - Create an entry"
    p "3 - Search for an entry"
    p "4 - Import entries from a CSV"
    p "5 - Exit"
    print "Enter your selection: "
    # we retrieve user input from thecommand line using gets reads the next line from standard input
    selection = gets.to_i
    p "You picked #{selection}"

    # here we use a case statement operator to determine the proper response to the users input
    # a case statment operator if like a if/ if else statement it is rubys version of a switch statement from javascript
    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        search_entries
        main_menu
      when 3
        system "clear"
        read_csv
        main_menu
      when 5
        p "Good-bye!"

        # here we terminate the the program
        exit(0)

      # if the input from the user is anything else we return a statment stating that the command is not valid
      else
        system "clear"
        p "Sorry, that is not a valid input"
        main_menu

      end
    end

    # here we create the methods for the commands that will be called form the user
    def view_all_entries
      address_book.entries.each do |entry|
        system "clear"
        p entry.to_s

        entry_submenu(entry)
      end

        system "clear"
        p "End of entries"
    end

    def create_entry
      # Here we clear the screen before diplaying the create new entry prompt
      system "clear"
      print "New AddressBloc Entry"

      # print works just like put except it doesnt add a newline
      print "Name: "
      name = gets.chomp
      print "Phone number: "
      phone_number = gets.chomp
      print "Email"
      email = gets.chomp

      # add a new entry to the address book by calling the function add_entry that we created in address_book.rb
      address_book.add_entry(name, phone_number, email)

      system clear
      p "New entry created"
    end

    def search_entries
    end

    def read_csv
    end

    def entry_submenu(entry)
      # display the submenu options
      p "n - next entry"
      p "d - delete entry"
      p "e - edit this entry"
      p "m - return main menu"

      # chomp removes any trailing whitespce from the strong gets returns
      selection = gets.chomp


      case selection
        # when the user asks to see the next entry, we can do nothing and control will be returned to veiw_all_entries
        when "n"
        when "d"
        when "e"
        when "m"
          system "clear"
          main_menu
        else
          system "clear"
          p "#{selection} is not valid input"
          entry_submenu(entry)
        end
      end

end
