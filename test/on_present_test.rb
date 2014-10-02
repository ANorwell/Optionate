require_relative 'test_helper'

class OnPresentTest < Minitest::Should::TestCase
  context 'defined objects' do
    setup do
      @defined = 1
    end

    should 'invoke a provided block' do
      @defined.on_present { |x| @x = x }
      assert_equal @defined, @x
    end
  end

  context 'nil objects' do
    should 'not invoke a provided block' do
      nil.on_present { |x| @x = 1 }
      assert_equal nil, @x
    end
  end
end
