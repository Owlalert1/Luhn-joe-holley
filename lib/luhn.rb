module Luhn
    class CreditCardNumber
    def initialize(number)
      @card_number = number
      @digits = []
    end
       
          #
          # Step 1.
          #
  def establish_individual_digits
    ccn_as_string = @card_number.to_s
    ccn_as_string.each_char { |digit|
      @digits << digit.to_i
    }
    @digits
  end
      
          #
          # Step 2.
          #
  def double_every_other_digit!
          #
          # Iterate over @digits from right to left - that is, backwards.
          # Skip the first digit and double every other one as we iterate.
          # We can use a boolean to tell us whether or not to skip a digit.
          #
      skip = true
      working_index = @digits.size - 1
      while working_index >= 0
        @digits[working_index] *= 2 unless skip
      
        skip = !skip
        working_index -= 1
      end
      @digits
  end
      
          #
          # Step 3.
          #
  def subtract_nine_as_required!
    @digits.each.with_index { |digit, index|
      @digits[index] -= 9 if digit >= 10
    }
    @digits
  end
      
          #
          # Step 4.
          #
  def sum_all_digits
    sum = 0
    @digits.each { |digit|
      sum += digit.to_i
    }
    sum
  end
end


    
  def self.is_valid?(number)
    ccn = CreditCardNumber.new(number)
    #puts ccn.establish_individual_digits.inspect
    #puts ccn.double_every_other_digit!.inspect
    #puts ccn.subtract_nine_as_required!.inspect
    #puts ccn.sum_all_digits
    ccn.establish_individual_digits
    ccn.double_every_other_digit!
    ccn.subtract_nine_as_required!
    (ccn.sum_all_digits % 10) == 0
  end
end




