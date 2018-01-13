require_relative 'entry'
# here we are telling ruby to load the library named entry.rb which is were we are pulling the entries from
require "csv"


  class AddressBook
     attr_reader :entries

     def initialize
       # this is an empty array that will take in the entry that is provided in entry.rb
       # arrays can hold a goup of varibales in each of its index. Think of a array within another array
       @entries = []
     end

     #The method starts by reading the file, using  File.read. The file will be in a CSV format. We use the CSV class to parse the file. The result of CSV.parse is an object of type CSV::Table.
    def import_from_csv(file_name)
       csv_text = File.read(file_name)
       csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
      # here we loop through the rows of the csv files and add them in the entry
      # we also create a hash for each row
      csv.each do |row|
        row_hash = row.to_hash
        add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
      end
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

   #searches addressbook for a specific entry by name
   def binary_search(name)

     # the index of the leftmost item in the array is lower and upp is the index rightmost
     lower = 0
     upper = entries.length - 1

     # we loop while our lower index is less than or equal to our upper index
   while lower <= upper
     mid = (lower + upper) /2
     mid_name = entries[mid].name
     # if the name is above the mid then we look there if the name is the mid entry then we found it if the name is below the mid then we look at the entries below
     if name == mid_name
       return entries[mid]
     elsif name < mid_name
       upper = mid - 1
     elsif name > mid_name
       lower = mid + 1
     end
    end
    # if no match is found we return nil
     return nil
   end

   def iterative_search(input)
     index = 0
    for entry in entries
     name = entries[index].name
     if name == input
       return entries[index]
     elsif name != input
       index += 1
     end
    end
       return nil
  end




  end
