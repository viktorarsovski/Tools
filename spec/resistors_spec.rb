RSpec.describe Tools::ResistorColorDuo do
  it 'has 15 ohms without multiplier' do
    resistor = Tools::ResistorColorDuo.new(['brown', 'green'])
    expect(resistor.resistance).to eq(15)
  end

  it 'has 15 ohms with multiplier' do
    resistor = Tools::ResistorColorDuo.new(['brown', 'green', 'black'])
    expect(resistor.resistance).to eq(15)
  end

  it 'has 2700000 ohms resistance and +/- 1% tolerance' do
    resistor = Tools::ResistorColorDuo.new(['red', 'violet', 'green', 'brown'])
    expected = "2700000 ohms +/- 1%"

    expect(resistor.specification).to eq expected
  end

  it 'has 12000 ohms and +/- 20% tolerance without tolerance' do
    resistor = Tools::ResistorColorDuo.new(['brown', 'red', 'orange'])
    expected = "12000 ohms +/- 20%"

    expect(resistor.specification).to eq expected
  end

  it 'has 12000 ohms and +/- 5% tolerance' do
    resistor = Tools::ResistorColorDuo.new(['brown', 'red', 'orange', 'gold'])
    expected = "12000 ohms +/- 5%"

    expect(resistor.specification).to eq expected
  end
end