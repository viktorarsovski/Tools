RSpec.describe Tools::Armstrong do
  it 'checks that 9 is an Armstrong number' do
    armstrong = Tools::Armstrong.new(9)
    expect(armstrong.valid?).to be true
  end

  it 'checks that 10 is not an Arsmtrong number' do
    armstrong = Tools::Armstrong.new(10)
    expect(armstrong.valid?).to be false
  end

  it 'checks that 153 is an Arsmtrong number' do
    armstrong = Tools::Armstrong.new(153)
    expect(armstrong.valid?).to be true
  end

  it 'checks that 154 is not an Armstrong number' do
    armstrong = Tools::Armstrong.new(154)
    expect(armstrong.valid?).to be false
  end

  it 'checks that -153 is not an Armstrong number' do
    armstrong = Tools::Armstrong.new(-153)
    expect(armstrong.valid?).to be true
  end
end