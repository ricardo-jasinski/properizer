require 'properizer/version'

module Properizer

  SHORT_CONNECTOR_WORDS = ['De', 'Da', 'Do', 'Das', 'Dos', 'Of', 'And', 'E']
  BRAZIL_STATE_ACRONYMS = %w(AC AL AM AP BA CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO)
  FORCED_UPCASED_WORDS = ['S.A.', 'SA', 'DR', 'ESF'] + BRAZIL_STATE_ACRONYMS

  def self.proper(text)
    original_string_is_fully_uppercased = (text == text.upcase)

    words = text.split.map do |word|
      # If the original string was all upcased then there's no letter casing to
      # preserve; just capitalize the word (AAA -> Aaa)
      if original_string_is_fully_uppercased
        word = unicode_capitalize(word)
      end

      word_is_fully_lowercased = (word == unicode_downcase(word))
      if word_is_fully_lowercased
        word = unicode_capitalize(word)
      end

      word = unicode_downcase(word) if SHORT_CONNECTOR_WORDS.include?(word)

      word = word.upcase if FORCED_UPCASED_WORDS.include?(word.upcase)

      # Assume that a word with no vowels is an acronym, so convert it to
      # uppercase (Xxx -> XXX)
      word = word.upcase unless has_vowels?(word)

      word
    end

    sentence = words.join(' ')

    # Ensure first letter is always capitalized
    sentence[0] = sentence[0].capitalize

    sentence
  end

private

  # Ruby's #downcase doesn't work properly with accented characters
  def self.unicode_downcase(text)
    text.downcase.tr('AÁÀÄÃEÉÊÈËIÍÎÌÏOÓÔÒÖUÚÛÙÜÇ', 'aáàäãeéêèëiíîìïoóôòöuúûùüç')
  end

  # Ruby's #capitalize doesn't work properly with accented characters
  def self.unicode_capitalize(text)
    text[0].capitalize + unicode_downcase(text[1..-1])
  end

  def self.has_vowels?(word)
    word.match(/[aáàäãeéêèëiíîìïoóôòöuúûùüAÁÀÄÃEÉÊÈËIÍÎÌÏOÓÔÒÖUÚÛÙÜ]/).to_a.any?
  end

  def self.apply_method_on_matches!(text, regexp, method)
    matches = text.scan(regexp).flatten
    matches.each do |match|
      text.gsub!(match, match.send(method))
    end
  end
end
