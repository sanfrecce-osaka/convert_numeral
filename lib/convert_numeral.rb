require 'convert_numeral/version'

module ConvertNumeral
end

class Integer
  TEN_THOUSAND_NUMERALS = [''].concat(%w[万 億 兆 京 垓 𥝱 穣 溝 澗 正 載 極 恒河沙 阿僧祇 那由他 不可思議 無量大数]).map(&:freeze).freeze
  THOUSAND_NUMERALS = %w(十 百 千).map(&:freeze).freeze
  NUMERALS = %w(零 一 二 三 四 五 六 七 八 九).map(&:freeze).freeze

  def to_chinese_numeral
    return NUMERALS[0] if self == 0

    string = self.to_s
    total_length = string.length

    return convert_thousand(string, total_length) if total_length <= 4

    quo, mod = total_length.divmod(4)
    limit = (mod == 0) ? quo - 1 : quo

    separated_numerals_by_four_digit =
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

    separated_numerals_by_four_digit
      .map.with_index do |numeral, index|
        converted_string = convert_thousand(numeral, numeral.length, index, limit)
        converted_string.empty? ? '' : converted_string + TEN_THOUSAND_NUMERALS[index]
      end
      .reverse
      .join
  end

  private

  def convert_thousand(string, char_count, index = 0, limit = 0)
    (1..char_count).inject('') do |current_string, digit|
      numeral = string[-digit].to_i
      thousand_numeral = THOUSAND_NUMERALS[digit - 2]
      add_string =
        if digit == 1
          numeral > 0 ? NUMERALS[numeral] : ''
        elsif digit == 4
          if index < limit
            numeral > 0 ? NUMERALS[numeral] + thousand_numeral : ''
          else
            numeral > 1 ? NUMERALS[numeral] + thousand_numeral : thousand_numeral
          end
        else
          if numeral == 0
            ''
          elsif numeral == 1
            thousand_numeral
          else
            NUMERALS[numeral] + thousand_numeral
          end
        end

      add_string + current_string
    end
  end
end
