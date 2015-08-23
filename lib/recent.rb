class Recent
  attr_accessor :list

  def initialize
    @list = Array.new
  end

  def add_to_list
    puts "Please enter an item for your list:"
    input = gets.chomp
    if search_for_entry(input)
      delete_and_re_add(input)
    elsif !search_for_entry(input)
      @list.unshift input
    end
    puts "Your recently used list: #{@list}"
    get_input
  end

  def search_for_entry(input)
    @list.include? input
  end

  def delete_and_re_add(input)
    @list.delete input
    @list.unshift input
  end

  def search_the_list
    puts "Enter the index value you wish to search (must be a number!):"
    input = gets.chomp
    if input.to_i.is_a?(Integer)
      if @list[input.to_i]
        puts "We found the item on the list!"
        puts @list[input.to_i]
      else
        puts "We couldn't find the item on the list..."
        get_input
      end
    else
      puts "You must enter a number!"
    end
  end

  def get_input
    puts "Search for an item or add? Enter 1 to search or 2 to add:"
    input = gets.chomp
    if input.to_i == 1
      search_the_list
    elsif input.to_i == 2
      add_to_list
    else
      puts "You must enter either 1 or 2"
      get_input
    end
  end
end

Recent.new.get_input
