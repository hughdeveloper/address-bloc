require_relative '../models/address_book'

  RSpec.describe AddressBook do


    describe "attributes" do
      it "responds to entries" do
        book = AddressBook.new
        expect(book).to respond_to(:entries)
      end

      it "initializes entries as an aray" do
        book = AddressBook.new
        expect(book.entries).to be_an(Array)
      end

      it "initializes entries as empty" do
        book = AddressBook.new
        expect(book.entries.size).to eq(0)
      end
    end

    describe "#add_entry" do
     it "adds only one entry to the address book" do
       book = AddressBook.new
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

       expect(book.entries.size).to eq(1)
     end

     it "adds the correct information to entries" do
       book = AddressBook.new
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]

       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
   end

   describe "#remove_entry" do
     it "confirm that a single entry is removed" do
      book = AddressBook.new

      #we add 2 entries to the address book for this test. One will be the one that we delete while the other will be the one that should remain
      book.add_entry('Jack Lovelace', '010.010.1815', 'augusta.luke@lovelace.com')

      # here we set up what the second entry is. We set up varibales for things such as name becasue we will be calling it in both the add and then remove entry calls.
      # we could have not set up the variables such as name and just pluged them into bot the remove and add however if we made a typo error the test could cause problems even if the method is correct
      name = "Ada Lovelace"
      phone_number = "010.012.1815"
      email = "augusta.king@lovelace.com"
      book.add_entry(name, phone_number, email)

      expect(book.entries.size).to eq 2
      book.remove_entry(name, phone_number, email)
      expect(book.entries.size).to eq 1
      expect(book.entries.first.name).to eq ("Jack Lovelace")
     end
   end



 end
