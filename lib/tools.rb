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

  class ResistorColorDuo
    COLOR_VALUES = {
      black: {
        value: 0,
        multiplier: 10**0,
        tolerance: 20
      },
      brown: {
        value: 1,
        multiplier: 10**1,
        tolerance: 1
      },
      red: {
        value: 2,
        multiplier: 10**2,
        tolerance: 2
      },
      orange: {
        value: 3,
        multiplier: 10**3
      },
      yellow: {
        value: 4,
        multiplier: 10**4
      },
      green: {
        value: 5,
        multiplier: 10**5,
        tolerance: 0.5
      },
      blue: {
        value: 6,
        multiplier: 10**6,
        tolerance: 0.25
      },
      violet: {
        value: 7,
        multiplier: 10**7,
        tolerance: 0.1
      },
      gray: {
        value: 8,
        multiplier: 10**8,
        tolerance: 0.05
      },
      white: {
        value: 9,
        multiplier: 10**9
      },
      gold: {
        multiplier: 10**-1,
        tolerance: 5
      },
      silver: {
        multiplier: 10**-2,
        tolerance: 10
      }
    }

    def initialize(resistor)
      @value1, @value2, @multiplier, @tolerance = resistor
    end

    def specification
      "#{resistance} ohms +/- #{tolerance}%"
    end

    def resistance
      (two_digits(@value1) * 10 + two_digits(@value2)) * multiplier
    end

    def two_digits(color)
      COLOR_VALUES[color.downcase.to_sym][:value]
    end

    private

    def multiplier
      @multiplier.nil? ? @multiplier = 1 : COLOR_VALUES[@multiplier.downcase.to_sym][:multiplier]
    end

    def tolerance
      @tolerance.nil? ? @tolerance = 20 : COLOR_VALUES[@tolerance.downcase.to_sym][:tolerance]
    end
  end

  class Armstrong
    def initialize(number)
      @number = number
    end

    def valid?
      sum == number
    end

    private

    def digits
      number.digits
    end

    def size
      digits.size
    end

    def sum
      digits.sum {|digit| digit**size }
    end

    def number
      @number.abs
    end
  end
end

