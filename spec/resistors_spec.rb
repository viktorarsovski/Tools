RSpec.describe Tools::Resistors do
  it 'can show only two numbers as output, and ignores third color as input' do
    resistor = Tools::Resistors.new('green', 'blue', 'white')
    expect(resistor.resistor_values). to eq 56
  end

  it 'can show two indentical numbers as  output, if two input colors are same' do
    resistor = Tools::Resistors.new('red', 'red', 'black')
    expect(resistor.resistor_values). to eq 22
  end

  it 'doesn\' put 0 as output and takes third color, if first or second is black' do
    resistor = Tools::Resistors.new('green', 'black', 'orange')
    expect(resistor.resistor_values). to eq 53
  end

  it "ignores '-' if first two input colors are gold or silver, and takes third color" do
    resistor = Tools::Resistors.new('gold', 'gray','orange')
    expect(resistor.resistor_values). to eq 83
  end
end