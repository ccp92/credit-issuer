class Issuer
  def getIssuer(card_number)
    digits = card_number.to_s.split('').map! { |element| element.to_i }
    return 'AMEX' if amex?(digits)
    return 'Discover' if discover?(digits)
    return 'Mastercard' if mastercard?(digits)
    return 'VISA' if visa?(digits)
    'Unknown'
  end

  private

  def amex?(digits)
    ([34, 37].include? id(digits[0..1])) && digits.length == 15
  end

  def discover?(digits)
    id(digits[0..3]) == 6011 && digits.length == 16
  end

  def mastercard?(digits)
    digits.length == 16 && [51, 52, 53, 54, 55].include?(id(digits[0..1]))
  end

  def visa?(digits)
    digits[0] == 4 && (digits.length == 13 || digits.length == 16)
  end

  def id(opening_digits)
    opening_digits.join.to_i
  end
end
