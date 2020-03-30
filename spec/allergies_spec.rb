RSpec.describe Tools::Allergies do
  describe "determine whether or not they're allergic to a given item" do
    it 'matches the allergen with the score' do
      allergies = Tools::Allergies.new(1)
      expect(allergies.allergic_to?('eggs')).to be true
    end

    it 'does not match the allergen with the score' do
      allergies = Tools::Allergies.new(17)
      expect(allergies.allergic_to?('strawberries')).to be false
    end

    it 'matches multiple allergens with one score' do
      allergies = Tools::Allergies.new(5)
      expect(allergies.allergic_to?('eggs')).to be true
      expect(allergies.allergic_to?('shellfish')).to be true
      expect(allergies.allergic_to?('tomatoes')).to be false
    end
  end

  describe "which allergens they are alergic to" do
    it 'has no allergens 'do
      allergies = Tools::Allergies.new(0)
      expected = []
      expect(allergies.allergens).to match_array(expected)
    end

    it 'can be only one alergen listed' do
      allergies = Tools::Allergies.new(8)
      expected = ['strawberries']
      expect(allergies.allergens).to match_array(expected)
    end

    it 'can be more than one alergen listed' do
      allergies = Tools::Allergies.new(26)
      expected = ['strawberries','tomatoes', 'peanuts']
      expect(allergies.allergens).to match_array(expected)
    end

    it 'can list all the allergens' do
      allergies = Tools::Allergies.new(255)
      expected = ['chocolate','strawberries','tomatoes', 'peanuts','pollen','cats',"eggs", "shellfish"]
      expect(allergies.allergens).to match_array(expected)
    end

    it 'ignores allergens not listed in HASH table 'do
      allergies = Tools::Allergies.new(257)
      expected = ['eggs']
      expect(allergies.allergens).to match_array(expected)
    end
  end
end
