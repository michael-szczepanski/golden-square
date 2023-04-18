class IOHelper
  def initialize(io = Kernel)
    @io = io
  end

  def format_menu(items)
    # formats the provided array into No. Item, Price format
    # returns a string
    return items.each_with_index.map { |item, i|
      "#{i+1}. #{item[:name]}, £#{item[:price]}"
    }.join("\n")
  end

  def print_main_user_screen
    "Please select option:\n1. List menu\n2. Select items\n3. See receipt\n4. Submit order"
  end

  def get_items(menu)
    items = []
    while true
      @io.puts "Which item would you like to add? (type 'done' to finish, or '0' to display menu)"
      user_choice = @io.gets.chomp
      return items if user_choice == "done"
      @io.puts "#{format_menu(menu)}" if user_choice == "0"
      if user_choice.to_i > 0 && user_choice.to_i <= menu.size
        items << user_choice.to_i
      else
        @io.puts "I did not understand that command" unless user_choice == 0
      end
      user_choice = nil
    end
  end
end