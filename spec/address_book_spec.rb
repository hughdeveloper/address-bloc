require_relative '../models/address_book'

  RSpec.describe AddressBook do

    #here we create a instance of the addressbook model and assign it ot the variable named book using the let syntax
    let(:book) { AddressBook.new }

    def check_entry(entry, expected_name, expected_number, expected_email)
     expect(entry.name).to eq expected_name
     expect(entry.phone_number).to eq expected_number
     expect(entry.email).to eq expected_email
    end



    describe "attributes" do
      it "responds to entries" do
        expect(book).to respond_to(:entries)
      end

      it "initializes entries as an aray" do
        expect(book.entries).to be_an(Array)
      end

      it "initializes entries as empty" do
        expect(book.entries.size).to eq(0)
      end
    end

    describe "#add_entry" do
     it "adds only one entry to the address book" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

       expect(book.entries.size).to eq(1)
     end

     it "adds the correct information to entries" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]

       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
   end

   describe "#remove_entry" do
     it "confirm that a single entry is removed" do

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

   #what is the # for
   describe "#import_from_csv" do
     it "imports the correct number of entries" do
       book.import_from_csv("entries.csv")
       book_size = book.entries.size
       expect(book_size).to eq 5
     end
     it "imports the 1st entry" do
       book.import_from_csv("entries.csv")
       entry_one = book.entries[0]

       check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
     end
     it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
     end

     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
     end

     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
       check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
     end

     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
       check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end
   end

   describe "#import_from_csv2" do
     it "imports the correct number of entries" do
       book.import_from_csv("entries_2.csv")
       book_size = book.entries.size
       expect(book_size).to eq 3
     end

     it "imports the 1st entry" do
       book.import_from_csv("entries_2.csv")
       entry_two = book.entries[0]
       check_entry(entry_two, "Billy", "555-555-4854", "bill@blocmail.com")
     end
     it "imports the 2st entry" do
       book.import_from_csv("entries_2.csv")
       entry_two = book.entries[1]
       check_entry(entry_two, "Bobby", "555-555-5415", "bob@blocmail.com")
     end
     it "imports the 3st entry" do
       book.import_from_csv("entries_2.csv")
       entry_two = book.entries[2]
       check_entry(entry_two, "Joey", "555-555-3660", "joe@blocmail.com")
     end
   end


   describe "#binary_search" do
     it "searches AddressBook for a non-existent entry" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Dan")
       expect(entry).to be_nil
     end

     it "searches AddressBook for Bill" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Bill")
       expect(entry).to be_a Entry
       check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
     end

     it "searches AddressBook for Bob" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bob")
      expect(entry).to be_a Entry
      check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
    end

    it "searches AddressBook for Joe" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Joe")
      expect(entry).to be_a Entry
      check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
    end

    it "searches AddressBook for Sally" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Sally")
      expect(entry).to be_a Entry
      check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
    end

    it "searches AddressBook for Sussie" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Sussie")
      expect(entry).to be_a Entry
      check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
    end

    it "searches AddressBook for Billy return nil" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Billy")
      expect(entry).to be_nil
    end
   end



   describe "#iterative_search" do
     it "searches the AddressBook for a non-existent entry" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Dan")
       expect(entry).to be_nil
     end

     it "searches AddressBook for Bill" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Bill")
       expect(entry).to be_a Entry
       check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
     end

     it "searches AddressBook for Bob" do
      book.import_from_csv("entries.csv")
      entry = book.iterative_search("Bob")
      expect(entry).to be_a Entry
      check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
    end

    it "searches AddressBook for Joe" do
      book.import_from_csv("entries.csv")
      entry = book.iterative_search("Joe")
      expect(entry).to be_a Entry
      check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
    end

    it "searches AddressBook for Sally" do
      book.import_from_csv("entries.csv")
      entry = book.iterative_search("Sally")
      expect(entry).to be_a Entry
      check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
    end

    it "searches AddressBook for Sussie" do
      book.import_from_csv("entries.csv")
      entry = book.iterative_search("Sussie")
      expect(entry).to be_a Entry
      check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
    end

    it "searches AddressBook for Billy" do
      book.import_from_csv("entries.csv")
      entry = book.iterative_search("Billy")
      expect(entry).to be_nil
    end
   end



 end
