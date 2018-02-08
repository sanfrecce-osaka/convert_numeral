require 'convert_numeral/version'

module ConvertNumeral
end

class Integer
  UNITS_GREATER_THAN_TEN_THOUSAND = [''].concat(%w(万 億 兆 京 垓 𥝱 穣 溝 澗 正 載 極 恒河沙 阿僧祇 那由他 不可思議 無量大数)).map(&:freeze).freeze
  UNITS_UNTIL_THOUSAND = %w(十 百 千).map(&:freeze).freeze
  TEN_NUMERALS = %w(零 一 二 三 四 五 六 七 八 九).map(&:freeze).freeze

  def to_chinese_numeral
    return TEN_NUMERALS[0] if self == 0

    string = self.to_s
    total_length = string.length

    return convert_separated_by_four_digit(string, total_length) if total_length <= 4

    quo, mod = total_length.divmod(4)
    limit = (mod == 0) ? quo - 1 : quo
    separated_numerals_by_four_digit = extract_numerals_separated_by_four_digit(string, limit, mod)

    separated_numerals_by_four_digit
      .map.with_index do |numeral, index|
        converted_string = convert_separated_by_four_digit(numeral, numeral.length, index, limit)
        converted_string.empty? ? '' : converted_string + UNITS_GREATER_THAN_TEN_THOUSAND[index]
      end
      .reverse
      .join
  end

  private

  def convert_separated_by_four_digit(string, char_count, index = 0, limit = 0)
    (1..char_count).inject('') do |current_string, digit|
      numeral = string[-digit].to_i
      thousand_numeral = UNITS_UNTIL_THOUSAND[digit - 2]
      add_string =
        if digit == 1
          numeral > 0 ? TEN_NUMERALS[numeral] : ''
        elsif digit == 4
          if index < limit
            numeral > 0 ? TEN_NUMERALS[numeral] + thousand_numeral : ''
          else
            numeral > 1 ? TEN_NUMERALS[numeral] + thousand_numeral : thousand_numeral
          end
        else
          if numeral == 0
            ''
          elsif numeral == 1
            thousand_numeral
          else
            TEN_NUMERALS[numeral] + thousand_numeral
          end
        end

      add_string + current_string
    end
  end

  def extract_numerals_separated_by_four_digit(string, limit, mod)
    (0..limit).map do |index|
      if index < limit
        string[-(index * 4 + 4), 4]
      elsif index == limit
        if mod == 0
          string[-(index * 4 + 4), 4]
        else
          string[-(index * 4 + mod), mod]
        end
      end
    end
  end
end

class String
  UNITS_GREATER_THAN_TEN_THOUSAND = [''].concat(%w(万 億 兆 京 垓 𥝱 穣 溝 澗 正 載 極 恒河沙 阿僧祇 那由他 不可思議 無量大数)).map(&:freeze).freeze
  TEN_NUMERALS = %w(零 一 二 三 四 五 六 七 八 九).map(&:freeze).freeze

  def to_arabic_numeral
    sentence_from_one_to_thousand = '(?:[一二三四五六七八九]?千)?(?:[二三四五六七八九]?百)?(?:[二三四五六七八九]?十)?(?:[零一二三四五六七八九])?'
    sentence = UNITS_GREATER_THAN_TEN_THOUSAND.map { |unit| "(#{sentence_from_one_to_thousand}#{unit})?" }.reverse.join
    regexp = Regexp.new(sentence)

    first_matches = scan(regexp).first.reverse

    first_matches.each_with_index.inject(0) do |current_total, (first_match, first_match_s_index)|
      if !first_match.nil?
        matches = first_match.scan(/([一二三四五六七八九]?千)?([二三四五六七八九]?百)?([二三四五六七八九]?十)?([零一二三四五六七八九])?/).first.reverse
        sum = matches.each_with_index.inject(0) do |current_sum, (match, index)|
          numeral = match&.slice(/[零一二三四五六七八九]/)
          
          if match.nil?
            current_sum
          elsif numeral.nil?
            current_sum + (10 ** (index))
          else
            current_sum + ((10 ** (index)) * TEN_NUMERALS.index(numeral))
          end
        end

        current_total + (sum * (10 ** (4 * first_match_s_index)))
      else
        current_total
      end
    end
  end
end
