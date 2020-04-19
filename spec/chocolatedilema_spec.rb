RSpec.describe Tools::ChocolateDilemma do
  it 'returns true for two arrays' do
    friends = Tools::ChocolateDilemma.new([[4, 3], [2, 4], [1, 2]], [[6, 2], [4, 2], [1, 1], [1, 1]])
    expect(friends.fairness?).to eq(true)
  end
end

