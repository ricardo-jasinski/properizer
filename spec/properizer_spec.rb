require 'spec_helper'

describe Properizer do
  it 'has a version number' do
    expect(Properizer::VERSION).not_to be nil
  end

  describe '#proper' do
    it 'keeps short connector words in lowercase' do
      expect(Properizer.proper('KING OF THE WORLD')).to eq 'King of The World'
      expect(Properizer.proper('RIO DE JANEIRO')).to eq 'Rio de Janeiro'
    end

    it 'changes Brazilian state acronyms to uppercase' do
      expect(Properizer.proper('AM - AMAZONAS')).to eq 'AM - Amazonas'
      expect(Properizer.proper('AP - AMAPÁ')).to eq 'AP - Amapá'
    end

    it 'keeps the first letter upcased if it is in the beginning of the sentence' do
      expect(Properizer.proper('of mice and man')).to eq 'Of Mice and Man'
    end

    it 'works for the following examples' do
      expect(Properizer.proper('KING KONG')).to eq 'King Kong'
      expect(Properizer.proper('RJ - RIO DE JANEIRO')).to eq 'RJ - Rio de Janeiro'
      expect(Properizer.proper('3601 - SP COTIA LAGEADINHO')).to eq '3601 - SP Cotia Lageadinho'
    end
  end
end
