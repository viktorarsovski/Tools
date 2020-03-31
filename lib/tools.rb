require "tools/version"

module Tools
  class Luhn
    def initialize(str)
      @str = str
      @stripped = @str.delete('')

    end

    def valid?
      #validations
      return false if @stripped.length <= 1
      return false if /\D/.match?(@stripped)

      ((rest_of_the_elements.sum + checksum.sum) % 10).zero? #calculation
    end

    private

    def checksum
      every_second_digit_from_right.map do |elem|
        double = elem * 2
        double > 9 ? double - 9 : double
      end
    end

    def every_second_digit_from_right
     indexes(1).map { |i| reversed_array[i].to_i }
      end

    def rest_of_the_elements
     indexes.map { |i| reversed_array[i].to_i }
      end

    def reversed_array
     @stripped.reverse.chars
      end

    def indexes(inx = 0)
     (inx..@stripped.length - 1).step(2)
      end
    end

  class Allergies
    LIMIT = 256
    ALLERGENS = {
      1 => 'eggs',
      2 => 'peanuts',
      4 => 'shellfish',
      8 => 'strawberries',
      16 => 'tomatoes',
      32 => 'chocolate',
      64 => 'pollen',
      128 => 'cats'
    }
    def initialize(score)
      @score = score
      @score -= LIMIT while @score >= LIMIT
    end

    def allergic_to?(allergen)
      allergens.include?(allergen)
    end

    def allergens
      score_allergens.map { |allergen| ALLERGENS[allergen] }
    end

    private

    def allergen_keys
      ALLERGENS.keys.select { |key| key <= @score }.sort.reverse
    end

    def score_allergens
      s = @score
      allergen_keys.select { |key| s >= key && s -= key }
    end
  end
end

class Resistors

  COLORS = {
    'black' => 0,
    'brown' => 1,
    'red' => 2,
    'orange' => 3,
    'yellow' => 4,
    'green' => 5,
    'blue' => 6,
    'violet' => 7,
    'grey' => 8,
    'white' => 9
  }

  def initialize(color1,color2,color3)
    @color1 = color1
    @color2 = color2
    @color3 = color3
  end

  def color_values
    (RESISTOR[@color1] + RESISTOR[@color2]).delete('0').delete('-')
  end

  def resistor_values
    values.to_i
  end

  def values
    colors.map{ |x| RESISTORS.index(x) }.first(2).join.to_i
    color_values.length < 2 ? color_values + RESISTOR[@color3] : color_values
  end
end
