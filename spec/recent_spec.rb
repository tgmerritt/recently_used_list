require_relative "../lib/recent"
require "spec_helper"
require "stringio"

describe Recent do
  context "Recent List" do
    let(:recent) { Recent.new }
    let(:input) { "an item" }

    allow(recent).to receive(get_input).and_return(false)

    it "initializes the list object" do
      expect(recent.is_a?(Recent)).to be true
    end

    it "responds to instance methods" do
      expect(recent).to respond_to(:list)
      expect(recent).to respond_to(:add_to_list)
      expect(recent).to respond_to(:search_for_entry)
      expect(recent).to respond_to(:delete_and_re_add)
      expect(recent).to respond_to(:get_input)
      expect(recent).to respond_to(:search_for_entry)
    end

    it "adds an item to the front of the list" do
      recent.add_to_list(input)
      expect(recent.list.first).to eq "an item"
      input = "another item"
      recent.add_to_list(input)
      expect(recent.list.first).to eq "another item"
    end

    it "searches the list for duplicate entry" do
      recent.add_to_list(input)
      expect(recent.list.first).to eq "an item"
    end

    it "does not add duplicate entries" do
      recent.add_to_list(input)
      recent.add_to_list(input)
      expect(recent.list.count).to eq 1
    end

    it "inserts the entry at the beginning of the array if entry exists" do
      recent.add_to_list(input)
      recent.add_to_list("another item")
      recent.add_to_list(input)
      expect(recent.list.count).to eq 2
      expect(recent.list).to eq(["an item", "another item"])
    end

  end

  context "Get input from console" do

    def receive_input
      $stdin.gets.chomp
    end

    describe "get input" do
      before do
        $stdin = StringIO.new("tyler\n")
      end

      after do
        $stdin = STDIN
      end

      it "should be 'tyler'" do
        expect(receive_input).to be == "tyler"
      end
    end

  end

end
