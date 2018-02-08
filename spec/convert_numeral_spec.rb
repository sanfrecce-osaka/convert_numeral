require 'spec_helper'

RSpec.describe ConvertNumeral do
  it 'has a version number' do
    expect(ConvertNumeral::VERSION).not_to be nil
  end
end

RSpec.describe Integer do
  describe '#to_chinese_numeral' do
    it 'convert integer into chinese numeral' do
      expect(0.to_chinese_numeral).to eq '零'
      expect(1.to_chinese_numeral).to eq '一'
      expect(2.to_chinese_numeral).to eq '二'
      expect(10.to_chinese_numeral).to eq '十'
      expect(13.to_chinese_numeral).to eq '十三'
      expect(44.to_chinese_numeral).to eq '四十四'
      expect(100.to_chinese_numeral).to eq '百'
      expect(605.to_chinese_numeral).to eq '六百五'
      expect(617.to_chinese_numeral).to eq '六百十七'
      expect(728.to_chinese_numeral).to eq '七百二十八'
      expect(1000.to_chinese_numeral).to eq '千'
      expect(1001.to_chinese_numeral).to eq '千一'
      expect(1010.to_chinese_numeral).to eq '千十'
      expect(1025.to_chinese_numeral).to eq '千二十五'
      expect(1111.to_chinese_numeral).to eq '千百十一'
      expect(1321.to_chinese_numeral).to eq '千三百二十一'
      expect(9999.to_chinese_numeral).to eq '九千九百九十九'
      expect(1_0000.to_chinese_numeral).to eq '一万'
      expect(1_0001.to_chinese_numeral).to eq '一万一'
      expect(1_1111.to_chinese_numeral).to eq '一万一千百十一'
      expect(20_0030.to_chinese_numeral).to eq '二十万三十'
      expect(1321_1400.to_chinese_numeral).to eq '千三百二十一万一千四百'
      expect(4567_8629.to_chinese_numeral).to eq '四千五百六十七万八千六百二十九'
      expect(1_0000_0000.to_chinese_numeral).to eq '一億'
      expect(1_0000_1000.to_chinese_numeral).to eq '一億一千'
      expect(1_1000_5000.to_chinese_numeral).to eq '一億一千万五千'
      expect(1000_0000_0000.to_chinese_numeral).to eq '千億'
      expect(1_0000_0000_0000.to_chinese_numeral).to eq '一兆'
      expect(1000_1000_1000_1000.to_chinese_numeral).to eq '千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000.to_chinese_numeral).to eq '一京'
      expect(1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一垓'
      expect(1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千垓一千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一𥝱'
      expect(1000_1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千𥝱一千垓一千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一穣'
      expect(1000_1000_1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千穣一千𥝱一千垓一千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一溝'
      expect(1000_1000_1000_1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一澗'
      expect(1000_1000_1000_1000_1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一正'
      expect(1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一載'
      expect(1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一極'
      expect(1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千極一千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一恒河沙'
      expect(1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千恒河沙一千極一千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一阿僧祇'
      expect(1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千阿僧祇一千恒河沙一千極一千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一那由他'
      expect(1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千那由他一千阿僧祇一千恒河沙一千極一千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一不可思議'
      expect(1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千不可思議一千那由他一千阿僧祇一千恒河沙一千極一千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'
      expect(1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000.to_chinese_numeral).to eq '一無量大数'
      expect(1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000.to_chinese_numeral).to eq '千無量大数一千不可思議一千那由他一千阿僧祇一千恒河沙一千極一千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'
    end
  end
end

RSpec.describe String do
  describe '#to_arabic_numeral' do
    it 'convert chinese numeral into integer' do
      expect('零'.to_arabic_numeral).to eq 0
      expect('一'.to_arabic_numeral).to eq 1
      expect('二'.to_arabic_numeral).to eq 2
      expect('十'.to_arabic_numeral).to eq 10
      expect('十三'.to_arabic_numeral).to eq 13
      expect('四十四'.to_arabic_numeral).to eq 44
      expect('百'.to_arabic_numeral).to eq 100
      expect('六百五'.to_arabic_numeral).to eq 605
      expect('六百十七'.to_arabic_numeral).to eq 617
      expect('七百二十八'.to_arabic_numeral).to eq 728
      expect('千'.to_arabic_numeral).to eq 1000
      expect('千一'.to_arabic_numeral).to eq 1001
      expect('千十'.to_arabic_numeral).to eq 1010
      expect('千二十五'.to_arabic_numeral).to eq 1025
      expect('千百十一'.to_arabic_numeral).to eq 1111
      expect('千三百二十一'.to_arabic_numeral).to eq 1321
      expect('九千九百九十九'.to_arabic_numeral).to eq 9999
      expect('一万'.to_arabic_numeral).to eq 1_0000
      expect('一万一'.to_arabic_numeral).to eq 1_0001
      expect('一万一千百十一'.to_arabic_numeral).to eq 1_1111
      expect('二十万三十'.to_arabic_numeral).to eq 20_0030
      expect('千三百二十一万一千四百'.to_arabic_numeral).to eq 1321_1400
      expect('四千五百六十七万八千六百二十九'.to_arabic_numeral).to eq 4567_8629
      expect('一億'.to_arabic_numeral).to eq 1_0000_0000
      expect('一億一千'.to_arabic_numeral).to eq 1_0000_1000
      expect('一億一千万五千'.to_arabic_numeral).to eq 1_1000_5000
      expect('千億'.to_arabic_numeral).to eq 1000_0000_0000
      expect('一兆'.to_arabic_numeral).to eq 1_0000_0000_0000
      expect('千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000
      expect('一京'.to_arabic_numeral).to eq 1_0000_0000_0000_0000
      expect('千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000
      expect('一垓'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000
      expect('千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000
      expect('一𥝱'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000_0000
      expect('千𥝱一千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000_1000
      expect('一穣'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000_0000_0000
      expect('千穣一千𥝱一千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000_1000_1000
      expect('一溝'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000_0000_0000_0000
      expect('千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000_1000_1000_1000
      expect('一澗'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000_0000_0000_0000_0000
      expect('千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000_1000_1000_1000_1000
      expect('一正'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000
      expect('千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000
      expect('一載'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000
      expect('千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000
      expect('一極'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000
      expect('千極一千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000
      expect('一恒河沙'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000
      expect('千恒河沙一千極一千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000
      expect('一阿僧祇'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000
      expect('千阿僧祇一千恒河沙一千極一千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000
      expect('一那由他'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000
      expect('千那由他一千阿僧祇一千恒河沙一千極一千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000
      expect('一不可思議'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000
      expect('千不可思議一千那由他一千阿僧祇一千恒河沙一千極一千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000
      expect('一無量大数'.to_arabic_numeral).to eq 1_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000
      expect('千無量大数一千不可思議一千那由他一千阿僧祇一千恒河沙一千極一千載一千正一千澗一千溝一千穣一千𥝱一千垓一千京一千兆一千億一千万一千'.to_arabic_numeral).to eq 1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000_1000
    end
  end
end
