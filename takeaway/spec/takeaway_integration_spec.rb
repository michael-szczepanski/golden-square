require 'takeaway'

RSpec.describe 'Takeaway integration' do
  it 'constructs' do
    expect( Takeaway.new ).to be
  end

  it 'displays menu' do
    takeaway = Takeaway.new
    expect( takeaway.list_menu )
      .to eq "1. UK Fillet (250g), £36\\n2. USDA Sirloin (350g), £48\\n3. OZ Ribeye (400g), £55\\n4. JP Wagyu Ribeye (300g), £126\\n5. SP Bone in Ribeye (600g), £84"
  end

  it 'adds selected items to the list' do
    takeaway = Takeaway.new
    takeaway.select_order(2)
    takeaway.select_order(3)
    expect( takeaway.see_receipt ).to eq "1. USDA Sirloin (350g), £48\\n2. OZ Ribeye (400g), £55"
  end
end