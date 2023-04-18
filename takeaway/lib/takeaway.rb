require 'printer'
  
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
    @printer = Printer.new
    @io = io
  end

  def list_menu
    # lists all items in @menu
    # returns string
    return @printer.format_menu(@menu)
  end

  def see_receipt
    # lists items in @order
    # returns string
    return @printer.format_menu(@order)
  end

  def select_order(item_no)
    # adds item from @menu to @order based on index
    # returns nothing
    @order << @menu[item_no - 1]
  end

  def run
    # displays the main user menu
    @io.puts @printer.print_main_user_screen
  end
end