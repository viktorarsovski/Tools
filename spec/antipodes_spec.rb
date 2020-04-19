RSpec.describe Tools::Antipodes do
  it 'gets an antipode array for array of even number of elements' do
   antipodes = Tools::Antipodes.new([2, 3, 4, 5])
   expect(antipodes.split_arrays).to eq(3.5, 3.5)
  end

  it 'gets an antipode array for array of odd number of elements' do
   antipodes = Tools::Antipodes.new([2,3,4,5,6])
   expect(antipodes.split_arrays).to eq(4, 3.5)
  end

end
