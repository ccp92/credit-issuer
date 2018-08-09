require 'issuer'

describe Issuer do
  it 'returns Unknown when an invalid number is provided' do
    expect(Issuer.new.getIssuer(123456789)).to eq('Unknown')
  end

  context 'VISA' do
    it 'returns VISA for a number starting with 4 and a length of 13' do
      expect(Issuer.new.getIssuer(4123456789012)).to eq('VISA')
    end

    it 'returns VISA for a number starting with 4 and a length of 16' do
      expect(Issuer.new.getIssuer(4123456789012123)).to eq('VISA')
    end

    it 'returns unknown for a number starting with 4 and a length of 12' do
      expect(Issuer.new.getIssuer(412345678901)).to eq('Unknown')
    end
  end

  context 'AMEX' do
    it 'returns AMEX for a number starting with 34 and a length of 15' do
      expect(Issuer.new.getIssuer(341234567890123)).to eq('AMEX')
    end

    it 'returns AMEX for a number starting with 37 and a length of 15' do
      expect(Issuer.new.getIssuer(371234567890123)).to eq('AMEX')
    end

    it 'returns unknown for a number starting with 34 and a length of 12' do
      expect(Issuer.new.getIssuer(341234567890)).to eq('Unknown')
    end

    it 'returns unknown for a number starting with 37 and a length of 12' do
      expect(Issuer.new.getIssuer(341234567890)).to eq('Unknown')
    end
  end

  context 'Discover' do
    it 'returns Discover for a number starting with 6011 and a length of 16' do
      expect(Issuer.new.getIssuer(6011123456789012)).to eq('Discover')
    end

    it 'returns Unknown for a number starting with 6011 and a length of 14' do
      expect(Issuer.new.getIssuer(60111234567890)).to eq('Unknown')
    end
  end

  context 'Mastercard' do
    it 'returns Mastercard for a number starting with 51 and a length of 16' do
      expect(Issuer.new.getIssuer(5112345678901234)).to eq('Mastercard')
    end

    it 'returns Mastercard for a number starting with 52 and a length of 16' do
      expect(Issuer.new.getIssuer(5212345678901234)).to eq('Mastercard')
    end

    it 'returns Mastercard for a number starting with 53 and a length of 16' do
      expect(Issuer.new.getIssuer(5312345678901234)).to eq('Mastercard')
    end

    it 'returns Mastercard for a number starting with 54 and a length of 16' do
      expect(Issuer.new.getIssuer(5412345678901234)).to eq('Mastercard')
    end

    it 'returns Mastercard for a number starting with 55 and a length of 16' do
      expect(Issuer.new.getIssuer(5512345678901234)).to eq('Mastercard')
    end

    it 'returns unknown for a number starting with 51 and a length of 15' do
      expect(Issuer.new.getIssuer(511234567890123)).to eq('Unknown')
    end
  end
end
