class Printer
  def format_menu(items)
    # formats the provided array into No. Item, Price format
    # returns a string
    return items.each_with_index.map { |item, i|
      "#{i+1}. #{item[:name]}, £#{item[:price]}"
    }.join('\n')
  end

  def print_main_user_screen
    "Please select option:\n1. List menu\n2. Select items\n3. See receipt\n4. Submit order"
  end
end