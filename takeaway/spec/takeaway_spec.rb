require 'takeaway'

RSpec.describe Takeaway do
  it 'displays menu' do
    io_dbl = double :Kernel
    takeaway = Takeaway.new(io_dbl)
    expect(io_dbl).to receive(:puts)
      .with("----\n1. UK Fillet (250g), £36\n2. USDA Sirloin (350g), £48\n3. OZ Ribeye (400g), £55\n4. JP Wagyu Ribeye (300g), £126\n5. SP Bone in Ribeye (600g), £84\n----")
    expect( takeaway.list_menu )
      .to eq "----\n1. UK Fillet (250g), £36\n2. USDA Sirloin (350g), £48\n3. OZ Ribeye (400g), £55\n4. JP Wagyu Ribeye (300g), £126\n5. SP Bone in Ribeye (600g), £84\n----"
  end

  it 'correctly adds items to and displays order' do
    io_dbl = double :Kernel
    takeaway = Takeaway.new(io_dbl)
    
    expect(io_dbl).to receive(:puts)
      .with("Please select option:\n1. List menu\n2. Select items\n3. See receipt\n4. Submit order")
    expect(io_dbl).to receive(:gets).and_return("2")
    expect(io_dbl).to receive(:puts)
      .with("Which item would you like to add? (type 'done' to finish, or '0' to display menu)")
    expect(io_dbl).to receive(:gets).and_return("1")
    expect(io_dbl).to receive(:puts)
      .with("Which item would you like to add? (type 'done' to finish, or '0' to display menu)")
    expect(io_dbl).to receive(:gets).and_return("done")
    expect(io_dbl).to receive(:puts)
      .with("Please select option:\n1. List menu\n2. Select items\n3. See receipt\n4. Submit order")
    expect(io_dbl).to receive(:gets).and_return("3")
    expect(io_dbl).to receive(:puts)
      .with("----\n1. UK Fillet (250g), £36\nOrder total: £36\n----")
      expect(io_dbl).to receive(:puts)
      .with("Please select option:\n1. List menu\n2. Select items\n3. See receipt\n4. Submit order")
    expect(io_dbl).to receive(:gets).and_return("4")
    expect(io_dbl).to receive(:puts)
      .with("Message sent")
    
    takeaway.run
  end

  context 'it warns user of invalid input' do
    it 'in process_user_input method' do
      io_dbl = double :Kernel
      takeaway = Takeaway.new(io_dbl)

      expect(io_dbl).to receive(:puts)
        .with("Please select option:\n1. List menu\n2. Select items\n3. See receipt\n4. Submit order")
      expect(io_dbl).to receive(:gets).and_return("5")
      expect(io_dbl).to receive(:puts)
        .with("I did not understand that input")
      expect(io_dbl).to receive(:puts)
        .with("Please select option:\n1. List menu\n2. Select items\n3. See receipt\n4. Submit order")
      expect(io_dbl).to receive(:gets).and_return("4")
      expect(io_dbl).to receive(:puts)
        .with("Message sent")

      takeaway.run
    end
  end

  xit 'sends a text message to user' do
  end
end