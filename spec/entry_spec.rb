require_relative '../models/entry'

  # States that the file is a spec file andthat it is testing entry
  RSpec.describe Entry do

    #describe gives our test structure  using it to communicate that the specs test the entry attributes
    describe "attributes" do
      # let allows use to declare what the new entry arguments are without having to write the code multiple times in each of our separate tests the orginal area were we would write the entry has been commented out with *********** in front
      let(:entry) {Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')}
      #The it method is used to represent a unique test, creating separate individual tests
      # this test tests weather them ethod responds to the given information (able to take in the argument)
      it "responds to name" do
        # here we are creating a new entry with the values of a name, phone number and a email
        # ************ entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

        # the expect method is delcaring what we expect the method to do. If the method produces the result we are looking for it passes if it doesn't it fails
        expect(entry).to respond_to(:name)
      end

      # in this test we are seeing if it reports back the correct information
      it "reports its name" do
        # ************ entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expect(entry.name).to eq('Ada Lovelace')
      end

      it "responds to phone number" do
        # ************ entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expect(entry).to respond_to(:phone_number)
      end

      it "reports its phone_number" do
        entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expect(entry.phone_number).to eq('010.012.1815')
      end

      it "responds to email" do
        # ************ entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expect(entry).to respond_to(:email)
      end

      it "reports its email" do
        # ************ entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expect(entry.email).to eq('augusta.king@lovelace.com')
      end


    # we use a separate describe block to separate the to_s test from the initializer test
    # the hastag in front of the to_s indicates that it is an instance method
    # to_s stands for convert to a string
    describe "#to_s" do
      it "prints an entry as a string" do
        entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"

        # we us eq to check that to_s returns a string equal to the expected string
        expect(entry.to_s).to eq(expected_string)
      end
    end


  end
end
