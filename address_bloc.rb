require_relative 'controllers/menu_controller'

# we create a new main menu when AddressBloc starts
menu = MenuController.new

# system clear clears the command line
system "clear"
p "Welcome to AddressBloc!"

# When we start up we will display the menu in the command line to the users
menu.main_menu
