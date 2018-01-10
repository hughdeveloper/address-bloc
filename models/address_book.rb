# here we are telling ruby to load the library named entry.rb which is were we are pulling the entries from
require_relative 'entry'

   class AddressBook
     attr_reader :entries

     def initialize
       @entries = []
     end

   def add_entry(name, phone_number, email)
     # here we created a variable called index, it is acting like i in a for loop that is used in javascript
     index = 0
     # here we loop though all the entries until we find the correct spot to place the new entry
     entries.each do |entry|
     # we are comparing name with the name of the current entry
     # If name lexicographically proceeds entry.name, we've found the index to insert at
     # we increment index and continue comparing with the other entries until we find the right spot
       if name < entry.name
         break
       end
       index+= 1
     end
     # we insert a new entry into entries using the calculatec index
     entries.insert(index, Entry.new(name, phone_number, email))
   end
 end
