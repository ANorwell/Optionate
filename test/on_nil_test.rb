require_relative 'test_helper'

class OnNilTest < Minitest::Should::TestCase
  context 'defined objects' do
    setup do
      @defined = 1
    end

    should 'not invoke a provided block' do
      @defined.on_nil { |x| @x = 1 }
      assert_equal nil, @x
    end
  end

  context 'nil objects' do
    should 'invoke a provided block' do
      nil.on_nil { |x| @x = 1 }
      assert_equal 1, @x
    end
  end
end
