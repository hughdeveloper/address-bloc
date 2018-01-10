# here we are telling ruby to load the library named entry.rb which is were we are pulling the entries from
require_relative 'entry'

   class AddressBook
     attr_reader :entries

     def initialize
       # this is an empty array that will take in the entry that is provided in entry.rb
       # arrays can hold a goup of varibales in each of its index. Think of a array within another array
       @entries = []
     end



    def remove_entry(name, phone_number, email)
      # here we set up a empty variable
       delete_entry = nil

       # here we loop though all the entries finding the entry that has a matching name, phone number and email. By checking all 3 things it stops us from delete entries of people that may have the same name.
       entries.each do |entry|
         if name == entry.name && phone_number == entry.phone_number && email == entry.email
           # if all conditions are met we set delete_entry to the entry that we are trying to delete
           delete_entry = entry
         end
     end
     # this is were we actually delete the entry. We delete the entry that delete_entry was set to
     entries.delete(delete_entry)
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
