require 'io_helper'

RSpec.describe IOHelper do
  it 'it initializes' do
    expect( IOHelper.new(Kernel) ).to be
  end

  context 'formats menu correctly' do
    it 'works for 1 item' do
      io_helper = IOHelper.new
      mock_menu = [{:name => 'name1', :price => 1}]
      expect(
        io_helper.format_menu(mock_menu)
      ).to eq "1. name1, £1"
    end

    it 'works for 2 items' do
      io_helper = IOHelper.new
      mock_menu = [{:name => 'name1', :price => 1}, {:name => 'name2', :price => 2}]
      expect(
        io_helper.format_menu(mock_menu)
      ).to eq "1. name1, £1\n2. name2, £2"
    end
  end

  it 'prints main menu' do
    io_helper = IOHelper.new
    expect( io_helper.print_main_user_screen )
      .to eq "Please select option:\n1. List menu\n2. Select items\n3. See receipt\n4. Submit order"
  end

  it 'returns correct array from get_items method' do
    io_dbl = double :Kernel
    mock_menu = [{:name=>"name",:price=>1}]
    io_helper = IOHelper.new(io_dbl)

    expect(io_dbl).to receive(:puts)
      .with("Which item would you like to add? (type 'done' to finish, or '0' to display menu)")
    expect(io_dbl).to receive(:gets).and_return("1")
    expect(io_dbl).to receive(:puts)
      .with("Which item would you like to add? (type 'done' to finish, or '0' to display menu)")
    expect(io_dbl).to receive(:gets).and_return("done")
    
    expect(
      io_helper.get_items(mock_menu)
    ).to eq [1]
  end

  context 'it warns user of invalid input' do
    it 'in get_items method' do
      io_dbl = double :Kernel
      mock_menu = [{:name=>"name",:price=>1}]
      io_helper = IOHelper.new(io_dbl)

      expect(io_dbl).to receive(:puts)
        .with("Which item would you like to add? (type 'done' to finish, or '0' to display menu)")
      expect(io_dbl).to receive(:gets).and_return("6")
      expect(io_dbl).to receive(:puts)
        .with("I did not understand that command")
      expect(io_dbl).to receive(:puts)
        .with("Which item would you like to add? (type 'done' to finish, or '0' to display menu)")
      expect(io_dbl).to receive(:gets).and_return("done")
      
      expect(
        io_helper.get_items(mock_menu)
      ).to eq []
    end
  end
end