require '.\lib\io_helper.rb'
  
class Takeaway
  def initialize(io = Kernel)
    @menu = [
      {:name => 'UK Fillet (250g)', :price => 36},
      {:name => 'USDA Sirloin (350g)', :price => 48},
      {:name => 'OZ Ribeye (400g)', :price => 55},
      {:name => 'JP Wagyu Ribeye (300g)', :price => 126},
      {:name => 'SP Bone in Ribeye (600g)', :price => 84}
    ]
    @order = []
    @io = io
    @io_helper = IOHelper.new(io)
  end

  def list_menu
    # lists all items in @menu
    # returns string
    formatted_menu = "----\n" + @io_helper.format_menu(@menu) + "\n----"
    @io.puts formatted_menu
    return formatted_menu

  end

  def see_receipt
    # lists items in @order
    # returns nothing
    formatted_order = "----\n" + @io_helper.format_menu(@order)
    order_total = @order.map{|item| item = item[:price]}.inject(:+)
    formatted_order << "\nOrder total: £#{order_total}\n----"
    @io.puts formatted_order
    return formatted_order
  end

  def select_order
    # adds item from @menu to @order based on index
    # returns nothing
    item_nos = @io_helper.get_items(@menu)
    item_nos.each { |item_no| @order << @menu[item_no - 1] }
  end

  def submit_order
    @io_helper.send_message_to_user
    @io.puts "Message sent"
  end

  def process_user_input(option)
    case option
    when "1"
      list_menu
      return true
    when "2"
      select_order
      return true
    when "3"
      see_receipt
      return true
    when "4"
      submit_order
      return false  
    else
      @io.puts "I did not understand that input"
      return true    
    end
  end

  def run
    # displays the main user menu
    order_pending = true

    while order_pending
      @io.puts @io_helper.print_main_user_screen
      user_input = @io.gets.chomp
      order_pending = process_user_input(user_input) 
    end

    return "Message sent"
  end
end

#takeaway = Takeaway.new(Kernel)
#takeaway.run