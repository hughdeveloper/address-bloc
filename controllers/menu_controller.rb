require_relative '../models/address_book'
require 'pry-byebug'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu

    # here we display the main menu options to the command line
    p "Main Menu - #{address_book.entries.count} entries"
    p "1 - View all entries"
    p "2 - View Entry Number n"
    p "3 - Create an entry"
    p "4 - Search for an entry"
    p "5 - Import entries from a CSV"
    p "6 - Exit"
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
        view_entry_number
        main_menu
      when 3
        system "clear"
        create_entry
        main_menu
      when 4
        system "clear"
        search_entries
        main_menu
      when 5
        system "clear"
        read_csv
        main_menu
      when 6
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
        puts entry.to_s

        entry_submenu(entry)
      end

        system "clear"
        p "End of entries"
    end

    def view_entry_number
      system "clear"
      print "Enter Entry Number: "
      entry_number = gets.chomp
      entry_number_i = entry_number.to_i
      if entry_number_i.is_a?(Numeric) == true && entry_number_i != 0
        p "this worked"
      else
        p "Input not valid. Please enter a number."
      end
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
      print "Email: "
      email = gets.chomp

      # add a new entry to the address book by calling the function add_entry that we created in address_book.rb
      address_book.add_entry(name, phone_number, email)

      system "clear"
      p "New entry created"
    end

    def search_entries
      print "Search by name: "
      name = gets.chomp

      match = address_book.binary_search(name)
      system "clear"

      if match
        puts match.to_s
        search_submenu(match)
      else
        puts "No match found for #{name}"
      end
    end

    def delete_entry(entry)
     address_book.entries.delete(entry)
     puts "#{entry.name} has been deleted"
    end

    def edit_entry(entry)

     print "Updated name: "
     name = gets.chomp
     print "Updated phone number: "
     phone_number = gets.chomp
     print "Updated email: "
     email = gets.chomp
     #use .empty? to set attributes on entry only if a valid attribute was read from the user imput
     entry.name = name if !name.empty?
     entry.phone_number = phone_number if !phone_number.empty?
     entry.email = email if !email.empty?
     system "clear"
     
     puts "Updated entry:"
     puts entry
    end

    def read_csv

      print "Enter CSV file to import: "
      file_name = gets.chomp

      # check if file name is empty
      if file_name.empty?
        system "clear"
        puts "No CSV file read"
        main_menu
      end
      #here we import the csv file and clear the system. if the file does not exsist we prompt the user to try again
      begin
        entry_count = address_book.import_from_csv(file_name).count
        system "clear"
        puts "#{entry_count} new entries added from #{file_name}"
      rescue
        puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
        read_csv
      end

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
          delete_entry(entry)
        when "e"
          edit_entry(entry)
          entry_submenu(entry)
        when "m"
          system "clear"
          main_menu
        else
          system "clear"
          p "#{selection} is not valid input"
          entry_submenu(entry)
        end
      end

    def search_submenu(entry)

      puts "\nd - delete entry"
      puts "e - edit this entry"
      puts "m - return to main menu"

      selection = gets.chomp


      case selection
        when "d"
          system "clear"
          delete_entry(entry)
          main_menu
        when "e"
          edit_entry(entry)
          system "clear"
          main_menu
        when "m"
          system "clear"
          main_menu
        else
          system "clear"
          puts "#{selection} is not a valid input"
          puts entry.to_s
          search_submenu(entry)
      end
    end

end
